$LOAD_PATH << "."
require 'date'
require 'loader'
require 'foursh'
#`update.bat` updater but dont run right now
#defining constants
$DAYS = ["Sun", "Mon", "Tue", "Wed", "Thur", "Fri", "Sat"]



Shoes.app(title: "Baesler's Scheduling Application", width: 1024, height: 768, resizable: true) do
  require 'spreadsheetmock'
  require 'schutil'
  #ALL SETTING UP THE APPLICATION#
  @loader = Loader.new
  def init
    flow {
      nbtn = 0
      a = @loader.spawn_buttons
      a.each {|x| @btns[nbtn+=1] = button("#{x}").style(width:100, height:100)}
      load_active a
    }
  end
  init
end