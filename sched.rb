class Schedule < Shoes
  def initialize start_date, end_date
  	@sd, @ed = start_date, end_date
  end
end


#the following will load the current schedule.
class Loader
  def initialize

  end
  def get_day

  end
  def get_employees

  end
  
  def missing?

  end
end


def load

end


Shoes.app(title: "Baesler's Scheduling Application") do
  def init
    dates = load
    flow {
      1.upto(7) do |x|
        button("#{x}").style width:100, height:100
      end
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

end