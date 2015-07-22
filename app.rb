$LOAD_PATH << "."
require 'lib/scheduler'
#`update.bat` updater but dont run right now
#defining constants

Shoes.app(title: "Baesler's Scheduling Application", width: 1024, height: 768, resizable: true) do
  banner "Baesler's Scheduling Application - Under Heavy Development"
  #USER INTERFACE -> FOURSH.RB#
  flow {
    @shed = button("New").click{
      alert('hi!')
    }
    @editbutton = button("Edit").click {

    }
    @employees = button("Employees").click {

    }
    @sdays = button("Special Days").click {

    }
    @makenote = button("Make Note").click {

    }
    @backbutton = button("Go Back").click {

    }
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
      @calbtns.push(button(btn, width:75, height:75))
    end
  #END CALENDAR#


end