require 'bike'

describe Bike do

    describe '#initialize' do 
        it 'defaults @working as true' do
            expect(subject.working).to be true 
        end 
    end

    describe '#working?' do 
        it { is_expected.to respond_to(:working?) }
        it 'gives status' do 
            expect(subject.working?).to eq true 
        end
    end
    
    describe '#report_broken' do 
        it 'toggles @working to false' do 
            expect(subject.report_broken).to eq false 
        end
    end

end
