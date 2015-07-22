$LOAD_PATH << "."
require 'lib/calendar'
#require 'employee'
#require 'dbengine'
#require 'schedule'
#require 'foursh'
#require 'schutil'
#`update.bat` updater but dont run right now
#defining constants

Shoes.app(title: "Baesler's Scheduling Application", width: 1024, height: 768, resizable: true) do

  #USER INTERFACE -> FOURSH.RB#
  flow {
    @shed = button "New"
    @editbutton = button "Edit"
    @employees = button "Employees"
    @sdays = button "Special Days"
    @makenote = button "Make Note"
    @backbutton = button "Go Back"
  }
  #END UI#
  #BEGIN SETTING PROPERTIES OF THE TOOLBAR BUTTONS
  @toolbar = [@shed, @editbutton, @employees, @sdays, @makenote, @backbutton]
  #CALENDAR -> CALENDAR.RB#
    calendar = Calendar.new
    #NOTE#
    #THE FOLLOWING SHOULD BE MOVED INTO THE CALENDAR CLASS
    #AND THE BUTTONS SHOULD BE INITIALIZED AS OBJECTS WITH THEIR PROPERTIES SET
    #CLEAN UP THE FOLLOWING ASAP
    @calbtns = []
    calendar.spawn_buttons.each do |btn|
      #btn.click {Schedule.load_schedule} #needs class obviously!
      @calbtns.push(btn)
    end
  #END CALENDAR#


end