require 'date'


#defining constants
$DAYS = ["Sun", "Mon", "Tue", "Wed", "Thur", "Fri", "Sat"]


#the following will load the current schedule.
class Loader < Shoes
  def initialize
    @date = DateTime.now #get current date
    if @date.cwday === 7 
      @fresh = true
    else
      @fresh = true
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
      puts "hi!"
    end
    btns
  end
  def fresh?
    @fresh
  end
end




#        button("#{x}").style width:100, height:100



Shoes.app(title: "Baesler's Scheduling Application") do
  def init
    loader = Loader.new
    flow {
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