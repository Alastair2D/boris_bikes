run irb
require './lib/docking_station.rb'

# Bike Features


# DockingStation Features




# Van Features  
1. collect_broken_bikes
  ds1 = DockingStation.new
  b1 = Bike.new(working = false)
  ds1.dock(b1)
  v1 = Van.new
  v1.collect_broken_bikes(ds1)

2. deliver_broken_bikes(garage)
  b1 = Bike.new(working = false)
  v1 = Van.new
  v1.bikes << b1
  v1.deliver_broken_bikes(garage)

3. collect_repaired_bikes(garage)
  b1 = Bike.new
  v1 = Van.new
  v1.bikes << b1
  v1.collect_repaired_bikes(garage)