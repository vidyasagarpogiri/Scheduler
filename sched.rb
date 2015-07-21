require 'date'


#defining constants
$DAYS = ["Sun", "Mon", "Tue", "Wed", "Thur", "Fri", "Sat"]


#the following will load the current week / schedule.
class Loader
  def initialize
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
    btns = []
    if @fresh === true
      0.upto(6) do |x|
        tmp = x + @date.day
        btns.push("#{$DAYS[x]} #{tmp}")
      end
    else
      sundate = @date.day - @date.cwday
      0.upto(6) do |x|
        tmp = x+sundate
        btns.push("#{$DAYS[x]} #{tmp}")
      end
    end
    btns
  end
  def fresh?
    @fresh
  end
  #for now, the employees will just be a .txt file, serparated by columns
  def load_employees
    path = "employees.txt"
    fd = File.open(path, "r")
    fd.each_line do |line|
      #boobage for now
    end
  end
end







Shoes.app(title: "Baesler's Scheduling Application") do
  def init
    flow {
      loader = Loader.new
      a = loader.spawn_buttons
      a.each {|x| button("#{x}").style width:100, height:100}
    }
  end
  
  flow do
  	@shed = button "New"
  	@editbutton = button "Edit"
    @employees = button "Employees"
    @sdays = button "Special Days"
    @makenote = button "Make Note"
  end

 @mainview = init


  @shed.click{
    @mainview.toggle
  }
  @employees.click{
    @mainview.toggle
  }

end