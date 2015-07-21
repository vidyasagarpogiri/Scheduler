$LOAD_PATH << "."
require 'date'
require 'loader'
`update.bat`
#defining constants
$DAYS = ["Sun", "Mon", "Tue", "Wed", "Thur", "Fri", "Sat"]



Shoes.app(title: "Baesler's Scheduling Application", width: 1024, height: 768, resizable: true) do
  require 'spreadsheetmock'
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
  @active.push(@shed, @editbutton, @employees, @sdays, @makenote, @backbutton)
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
          flow height: 20 do 
            border black, strokewidth: 1
            para "Monday: #{x[:mon]}"
            button("7A")
            button("8A")
            button("9A")
            button("10A")
            button("11A")
            button("12P")
            button("1P")
            button("2P")
            button("3P")
            button("4P")
            button("5P")
            button("6P")
            button("7P")
            button("8P")
            button("9P")
            button("10P")
            button("11P")
            button("12A")
            button("1A")
            button("2A")
            button("3A")
            button("4A")
            button("5A")
            button("6A")
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