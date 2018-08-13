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
            expect(subject(50).capacity).to eq 50   
        end
    end


    it { is_expected.to respond_to(:release_bike) }

    it 'responds to #release_bike' do 
    expect(subject).to respond_to :release_bike
    end

    it 'releases working bikes' do
        bike = Bike.new
        expect(bike).to be_working
    end
    
    it 'allows bike to be docked' do
        expect(subject.dock(mockBike))              expect(subject.dock(bike)).to include(bike)
    end

    it 'raises an error when there are no bikes' do 
        expect{subject.release_bike}.to raise_error "Error - no bikes available"
    end

    it 'raises an error if trying to #dock(bike) when at capacity' do
        20.times {subject.dock(Bike.new)}
        expect{subject.dock(Bike.new)}.to raise_error "Error - no space available"
    end

end