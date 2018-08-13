require_relative 'bike'
require_relative 'van'

class DockingStation 
    attr_reader :bikes, :capacity

    DEFAULT_CAPACITY = 20

    def initialize(capacity = DEFAULT_CAPACITY)
        @capacity = capacity
        @bikes = []
        @broken_bikes = []
    end

    def release_bike
        fail "Error - no bikes available" if @bikes.empty?
        @bikes.pop
    end

    def full?
        @bikes.length >= @capacity
    end

    def dock(bike)
        fail "Error - no space available" if @bikes.length >= @capacity
        fail "Error - no space available" if full?
        @bikes << bike
    end

end