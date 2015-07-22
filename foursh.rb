$LOAD_PATH << "."
require 'loader'

#this class essentially sets up things such as the user interface

class Interface < Shoes
  def initialize
    flow do
      @shed = button "New"
      @editbutton = button "Edit"
      @employees = button "Employees"
      @sdays = button "Special Days"
      @makenote = button "Make Note"
      @backbutton = button "Go Back"
    end
  end
end