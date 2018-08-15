require 'van'
require 'docking_station'
require 'bike'

describe Van do
    subject(:van) { Van.new }
    let(:mockDockingStation) { double :dockingstation}  # Can you say e.g. { double : dockingstation, @broken_bikes = [mockBrokenBike] }
    let(:mockBike) { double :bike }
    let(:mockBrokenBike) { double :bike, working => false }

    describe '#collect_broken_bikes' do 
        it 'raises an error if @broken_bikes is empty' do 
        ds1 = DockingStation.new
        # bb1 = Bike.new(working = false)
        expect { subject.collect_broken_bikes(ds1) }.to raise_error 'Error - no broken bikes here'
        end    

        # allow(mockDockingStation).to receive(:broken_bikes)
        # expect { subject.collect_broken_bikes(mockDockingStation) }.to raise_error 'Error - no broken bikes here'
        # end 

        # before { mockDockingStation.broken_bikes << mockBrokenBike }
        # it 'picks up @broken_bikes and adds them into @broken_bikes_to_fix' do 
        #   expect(subject.broken_bikes_to_fix). to include mockBrokenBike
        # end        
    end

#   describe '#collect_broken_bikes' do
#     before { mockDockingStation.broken_bikes << mockBrokenBike }
#     it 'puts returns an array of broken bikes' do
#         allow(:mockDockingStation).to receive 
#       expect(subject.collect_broken_bikes(s1)).to include (b1)
#     end
#     it 'raises an error when there are no broken bikes to collect' do
#       station2.dock(broken_bike)
#       subject.collect_broken_bikes(station2)
#       expect{subject.collect_broken_bikes(station2)}.to raise_error 'No broken bikes to collect'
#     end
#   end

#   describe '#deliver_broken_bikes' do
#     it 'deposits broken_bikes at the garage' do
#       expect(subject.deliver_broken_bikes(garage)).to eq []
#     end
#   end

#   describe '#collect_repaired_bikes' do
#     it 'picks up repaired bikes from the garage' do
#       expect(subject.collect_repaired_bikes(garage_fixed)).to eq [bike]
#     end
#   end

#   describe '#distribute_repaired_bikes' do
#       it 'returns repaired bikes to a station' do
#           expect(subject.distribute_repaired_bikes(station)).to eq []
#       end
#       it 'raises an error when there are no broken bikes to distribute' do
#         expect(subject.distribute_repaired_bikes(station)).to raise_error 'No repaired bikes to distribute'
#       end
#     end
end