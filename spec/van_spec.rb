require 'van'
require 'docking_station'
require 'bike'
require 'garage'

describe Van do
    subject(:van) { Van.new }
    let(:mockDockingStation) { double :dockingstation}  # Can you say e.g. { double : dockingstation, @broken_bikes = [mockBrokenBike] }
    let(:mockBike) { double :bike }
    let(:mockBrokenBike) { double :bike, working => false }
    let(:mockGarage) { double :garage }
    let(:mockRepairedBike) { double :bike }


    describe '#load_broken_bikes' do 
        it 'raises an error if @broken_bikes is empty' do 
            ds1 = DockingStation.new                                                                    # allow(mockDockingStation).to receive(:broken_bikes)   
            expect { subject.load_broken_bikes(ds1) }.to raise_error 'Error - no broken bikes'  # expect { subject.collect_broken_bikes(mockDockingStation) }.to raise_error 'Error - no broken bikes here'
        end    
    #     it 'picks up @broken_bikes and puts them in @broken_bikes_for_garage' do 
    #         # v1 = Van.new                             # mockDockingStation.broken_bikes << mockBrokenBike
    #         ds1 = DockingStation.new                   # allow(mockDockingStation).to receive(:broken_bikes)       
    #         bb1 = Bike.new(working = false)                          
    #         ds1.dock(bb1) 
    #         subject.load_broken_bikes(ds1)                             # subject.collect_broken_bikes(mockDockingStation)
    #         expect(subject.broken_bikes_for_garage).to include(bb1)            # expect(subject.broken_bikes_to_fix).to include mockBrokenBike
    #     end        
    end

    # describe '#clear_broken_bikes' do 
    #     it 'empties @broken_bikes' do 
    #         ds1 = DockingStation.new
    #         bb1 = Bike.new(working = false)
    #         ds1.dock(bb1)
    #         # subject.clear_broken_bikes(ds1) 
    #         # expect(ds1.broken_bikes).to be empty 
    #         expect(subject.clear_broken_bikes(ds1)).to be [] # or nil or [] or to be empty?
    #     end
    # end

    describe '#deliver_broken_bikes' do 
        it 'takes @broken_bikes_for_garage to garage' do 
            v1 = Van.new
            g1 = Garage.new
            ds1 = DockingStation.new
            bb1 = Bike.new(working = false)
            ds1.dock(bb1)
            v1.load_broken_bikes(ds1)
            expect(v1.deliver_broken_bikes(g1)).to include [[bb1]]
        end
    end

    describe '#load_repaired_bikes' do 
        it 'raises an error if @repaired_bikes is empty' do   
            g1 = Garage.new                           # allow(mockGarage).to receive(:repaired_bikes)                        
            expect { subject.load_repaired_bikes(g1) }.to raise_error 'Error - no repaired bikes' 
        end    
        it 'picks up @repaired_bikes and puts them in @fixed_bikes_to_distrubute' do
            g1 = Garage.new
            g1.repaired_bikes << mockRepairedBike
            expect(subject.load_repaired_bikes(g1)).to include mockRepairedBike
        end
    end

      describe '#distribute_repaired_bikes' do
          it 'returns repaired bikes to a station' do
              expect(subject.distribute_repaired_bikes(station)).to eq []
          end
          it 'raises an error when there are no broken bikes to distribute' do
            expect(subject.distribute_repaired_bikes(station)).to raise_error 'No repaired bikes to distribute'
          end

end
