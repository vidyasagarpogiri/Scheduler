#the following will load the current week / schedule.
require 'date'
class Loader
  @days = ["Sun", "Mon", "Tue", "Wed", "Thur", "Fri", "Sat"]
  def set_date
    @date = DateTime.now #get current date
    if @date.cwday === 7 #if its sunday, we're fresh
      @fresh = true
    else
      @fresh = false
    end
  end
  def weekday
    @date.cwday
  end
  def mdate
    @date.day
  end
  def spawn_buttons
    @btns = []
    if @fresh === true
      0.upto(6) do |x|
        tmp = x + @date.day
        @btns.push("#{$DAYS[x]} #{tmp}")
      end
    else
      sundate = @date.day - @date.cwday
      0.upto(6) do |x|
        tmp = x+sundate
        @btns.push("#{tmp}")
      end
    end
    @btns
  end
end