class DockingStation 
    attr_reader :bikes

    def initialize
        @capacity = 1
        @bikes = []
    end

    def release_bike
        fail "Error - no bikes available" if @bikes.empty?
        @bikes.pop
    end

    def dock(bike)
        fail "Error - no space available" if @bikes.length >= @capacity
        @bikes << bike
    end

end