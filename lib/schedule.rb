require 'lib/employee'
class Schedule
  def initialize
    @no_shifts = 3 #morning, afternoon, overnight.
    #we're going to go off of 24 hour time
    @morning_min_hour = 7
    @morning_max_hour = 16
    @afternoon_min_hour = 16
    @afternoon_max_hour = 23
    @overnight_min_hour = 23
    @overnight_max_hour = 7

  end
  def calculate_shifts

  end
end