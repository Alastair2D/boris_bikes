require 'docking_station'

describe DockingStation do
subject(:dockingstation) { DockingStation.new }
let(:mockBike) { double :bike }
# let(:mockBrokenBike) { double :bike, working => false } 

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
  
  describe '#release_bike' do                        # before (:each) { allow(subject.weather).to receive(:stormy?).and_return false }
    it 'responds to #release_bike' do                # Or: it { is_expected.to respond_to(:release_bike) }
        expect(subject).to respond_to :release_bike     
    end
    it 'releases working bikes' do
        subject.bikes << mockBike
        expect(subject.release_bike).to eq(mockBike)
    end
    it 'raises an error when attempting to release a broken bike' do
        # subject.bikes << mockBike   # subject.dock(:mockBrokenBike)  # subject.bikes << mockBrokenBike
        # allow(mockBike).to receive(:report_broken).and_return(false)
        b1 = Bike.new
        b1.report_broken
        subject.dock(b1)
        expect { subject.release_bike }.to raise_error 'Error - no working bikes available'
    end
    it 'raises an error when empty' do
        expect { subject.release_bike }.to raise_error 'Error - no bikes available'
    end
  end
      
  describe '#dock(bike)' do 
    it 'allows bike to be docked' do
      allow(mockBike).to receive(:working).and_return(true)
      expect(subject.dock(mockBike)).to include(mockBike)
    end
    it 'raises an error when there are no bikes' do 
      expect { subject.release_bike }.to raise_error "Error - no bikes available"
    end
    it 'raises an error if trying to #dock(bike) when at capacity' do
      allow(mockBike).to receive(:working).and_return(true)
      20.times { subject.dock(mockBike) }   # 20.times { station.dock(:mockBike) }
      expect { subject.dock(mockBike) }.to raise_error "Error - no space available"   # expect {station.dock(:bike)}.to raise_error 'docking station is full'
    end
  end

end
