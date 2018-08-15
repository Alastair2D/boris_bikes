class Garage

    attr_reader :bikes_awaiting_repair, :repaired_bikes

    def initialize 
        @bikes_awaiting_repair = []
        @repaired_bikes = []
    end

    def fix(bike)
        bike = bikes_awaiting_repair.sample
        bikes_awaiting_repair.delete(bike)
        repaired_bikes << bike
    end

end
