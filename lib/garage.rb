class Garage

    attr_reader :bikes_awaiting_repair, :repaired_bikes

    def initialize 
        @bikes_awaiting_repair = []
        @repaired_bikes = []
    end

end
