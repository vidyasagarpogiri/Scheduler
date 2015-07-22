$LOAD_PATH << "."
require 'mongoose'
################################################################
#just making an obvious note that this file needs A LOT of work#
################################################################
class DBEngine
  def initialize
  	load_db
  	@url = "mongodb://#{@username}:#{@password}@ds049288.mongolab.com:49288/scheduler"
  end
  def load_db
  	fd = File.open("dbinfo.txt", "r")
  	exit if fd === nil
  	fd.each_line do |line|
  		#should only be one line
  		a = line.split
  		@username = a[0]
  		@password = a[1]
  	end
  end
  def connect

  end
end