$LOAD_PATH << "."
require 'calendar'
#require 'employee'
#require 'dbengine'
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
  #CALENDAR -> CALENDAR.RB#
    calendar = Calendar.new
    calendar.spawn_buttons.each {|btn| button(btn, width:75, height:75)}
  #END CALENDAR#


end