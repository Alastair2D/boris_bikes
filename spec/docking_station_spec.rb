require 'docking_station'

describe DockingStation do

    it { is_expected.to respond_to(:release_bike) }

    it 'responds to #release_bike' do 
    expect(subject).to respond_to(:release_bike)
    end

    it 'creates a new instance of the Bike class' do 
        expect(subject.release_bike).to eq 
    end 

end