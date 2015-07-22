$LOAD_PATH << "."
require 'loader'
#require 'foursh'
require 'schutil'
#`update.bat` updater but dont run right now
#defining constants

class Interface < Shoes
  flow {
    @shed = button "New"
    @editbutton = button "Edit"
    @employees = button "Employees"
    @sdays = button "Special Days"
    @makenote = button "Make Note"
    @backbutton = button "Go Back"
  }
end
Shoes.app(title: "Baesler's Scheduling Application", width: 1024, height: 768, resizable: true)