require 'docking_station'

describe DockingStation do
    subject(:dockingstation) { DockingStation.new }
    let(:mockBike) { double :bike }
    let(:mockBrokenBike) { double :bike, working => false }

    describe '#initialize' do 
        it 'defaults capacity to 20' do 
            expect(subject.capacity).to eq 20
        end
        it 'allows variable capacity to be set' do 
        small_capacity = 10 
        small_station = DockingStation.new(small_capacity)     # small_station = DockingStation.new(10) 
        expect(small_station.capacity).to eq 10                # expect(small_station.capacity).to eq 10
        end
    end

    describe '#release_bike' do 
        before { subject.bikes << mockBike }
        it 'responds to #release_bike' do                      # Or: it { is_expected.to respond_to(:release_bike) }
            expect(subject).to respond_to :release_bike     
        end
        it 'releases working bikes' do
            expect(subject.release_bike).to eq(mockBike)
        end
    end
        
    describe '#dock(bike)' do 
        it 'allows bike to be docked' do
            expect(subject.dock(mockBike)).to include(mockBike)
        end
        it 'raises an error when there are no bikes' do 
            expect { subject.release_bike }.to raise_error "Error - no bikes available"
        end
        it 'raises an error if trying to #dock(bike) when at capacity' do
            20.times { subject.dock(mockBike) }
            expect { subject.dock(mockBike) }.to raise_error "Error - no space available"
        end
    end

end
