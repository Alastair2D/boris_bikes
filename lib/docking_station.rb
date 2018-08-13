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
    fail 'Error - no bikes available' if @bikes.empty? && @broken_bikes.empty?
    fail 'Error - no working bikes available' if @bikes.empty?
    @bikes.pop
  end  
  
  def dock(bike)
    fail "Error - no space available" if full?
    bike.working ? @bikes.push(bike) : @broken_bikes.push(bike)
  end  

  
private    
  
  def full?
    @bikes.length >= @capacity
  end  
  
  def empty?
    @bikes.empty?
  end

end
