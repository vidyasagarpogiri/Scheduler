$LOAD_PATH << "."
require 'foursh'
require 'loader'
require 'dbengine'


class UtilityClass
  def initialize
    @days = ["Sun", "Mon", "Tue", "Wed", "Thur", "Fri", "Sat"]
    @loader = Loader.new
  end
  def loader
  	@loader
  end
  def db_instance
  	@db
  end
end
