$LOAD_PATH << "."
require 'lib/loader'
class Calendar < Loader
  def initialize
    set_date
  end
  def select_day which
  	#call the db engine
  end
end