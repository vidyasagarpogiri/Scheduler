$LOAD_PATH << "."
require 'loader'
class Calendar < Loader
  def initialize
    set_date
  end
end