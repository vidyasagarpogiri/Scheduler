require 'date'
$LOAD_PATH << "."
`update.bat`
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
  #for now, the employees will just be a .txt file, separated by columns
  def load_employees
    employees = []
    path = "employees.txt"
    fd = File.open(path, "r")
    fd.each_line do |line|
      emp = {}
      a = line.split
      name = a[0]
      emp[:name] = name
      emp[:mon] = a[1]
      emp[:tue] = a[2]
      emp[:wed] = a[3]
      emp[:thu] = a[4]
      emp[:fri] = a[5]
      emp[:sat] = a[6]
      emp[:sun] = a[7]
      employees.push(emp)
    end
    employees
  end
end







Shoes.app(title: "Baesler's Scheduling Application", width: 1024, height: 768, resizable: true) do
  ##static menu bar##
  flow do
    @shed = button "New"
    @editbutton = button "Edit"
    @employees = button "Employees"
    @sdays = button "Special Days"
    @makenote = button "Make Note"
    @backbutton = button "Go Back"
  end
  ##end static menu bar##

  #ALL SETTING UP THE APPLICATION#

  @btns = {}
  @history = [] #this may be a bad approach but we'll try it
  @active = []
  @loader = Loader.new
  def init
    flow {
      nbtn = 0
      a = @loader.spawn_buttons
      a.each {|x| @btns[nbtn+=1] = button("#{x}").style(width:100, height:100)}
      load_active a
    }
  end
  def destroy_active
    @history.push(@active.pop) while @active.length > 0
  end
  def load_active which
    which.each do |btn|
      @active.push(btn)
    end
  end
  def emps_load
    emps = @loader.load_employees
    emps.each do |x|
      button("#{x[:name]}").style(width:50, height:50).click{
        destroy_active
        stack {
          #dropdown option list
          border black, strokewidth: 5
          stack height: 20 do 
            border black, strokewidth: 1
            para "Monday: #{x[:mon]}"
          end
          stack height: 20 do 
            border black, strokewidth: 1
            para "Tuesday: #{x[:tue]}"
          end
          stack height: 20 do 
            border black, strokewidth: 1
            para "Wednesday: #{x[:wed]}"
          end
          stack height: 20 do 
            border black, strokewidth: 1
            para "Thursday: #{x[:thu]}"
          end
          stack height: 20 do 
            border black, strokewidth: 1
            para "Friday: #{x[:fri]}"
          end
          stack height: 20 do 
            border black, strokewidth: 1
            para "Saturday: #{x[:sat]}"
          end
          stack height: 20 do
            border black, strokewidth: 1
            para "Sunday: #{x[:sun]}"
          end
        }
      } #this will work!!!!
    end
  end
  #END APPLICATION SETUP


  #BEGIN ACTUAL APPLICATION

  init
  @shed.click{
    #put something to select a week here
  }
  @employees.click{
    #listbox eventually maybe
    destroy_active
    a = emps_load
    load_active a
  }

end