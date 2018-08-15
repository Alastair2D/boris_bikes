require_relative 'docking_station'

class Van
    attr_reader :all_bikes_in_van, :broken_bikes_for_garage, :fixed_bikes_to_distribute
    attr_accessor :bikes, :broken_bikes, :bikes_awaiting_repair

    def initialize
      # @all_bikes_in_van = []  
      @broken_bikes_for_garage  = []
      @fixed_bikes_to_distribute = []
    end
 
    def load_broken_bikes(station)
      fail 'Error - no broken bikes' if station.broken_bikes.empty?
      broken_bikes_for_garage << station.broken_bikes
      # station.broken_bikes.clear
    end

    def clear_broken_bikes(station)
      station.broken_bikes.clear
    end

    def deliver_broken_bikes(garage)
      garage.bikes_awaiting_repair << broken_bikes_for_garage
      # broken_bikes_for_garage.clear
    end

    def load_repaired_bikes(garage)
      fail 'Error - no repaired bikes' if garage.repaired_bikes.empty?
      fixed_bikes_to_distribute << garage.repaired_bikes
      # garage.repaired_bikes.clear
    end


  
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