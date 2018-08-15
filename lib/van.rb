require_relative 'docking_station'

class Van
    attr_reader :all_bikes_in_van, :broken_bikes_to_fix, :fixed_bikes_to_distribute
    # attr_accessor :broken_bikes

    def initialize
      @all_bikes_in_van = []  
      @broken_bikes_to_fix  = []
      @fixed_bikes_to_distribute = []
    end
 
    def collect_broken_bikes(station)
      fail 'Error - no broken bikes here' if station.broken_bikes.empty?
    end



    # def collect_broken_bikes(station)
    #   fail 'No broken bikes to collect' if station.broken_bikes.empty?
    #   @bikes.concat station.broken_bikes
    #   station.broken_bikes.clear
    #   @bikes
    # end
  
    # def deliver_broken_bikes(garage)
    #   garage.bikes.concat @bikes
    #   @bikes.clear
    #   @bikes
    # end
  
    # def collect_repaired_bikes(garage)
    #   @bikes.concat garage.bikes
    #   garage.bikes.clear
    #   @bikes
    # end
  
    # def distribute_repaired_bikes(station)
    #   fail 'No repaired bikes to distribute' if @bikes.empty?
    #   station.bikes.concat @bikes
    #   @bikes.clear
    #   @bikes
    # end
  end