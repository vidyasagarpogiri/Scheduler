$LOAD_PATH << "."
require 'mongo'
################################################################
#just making an obvious note that this file needs A LOT of work#
################################################################
class DBEngine
  def initialize
  	load_db
  	@url = "mongodb://#{@username}:#{@password}@#{@base_url}"
    @client = Mongo::Client.new(@url)
  end
  def load_db
  	fd = File.open("dbinfo.txt", "r")
  	exit if fd === nil
  	fd.each_line do |line|
  		#should only be one line
  		a = line.split
  		@username = a[0]
  		@password = a[1]
      @base_url = a[2]
  	end
  end
  def rcv_employee
    
  end
  def update_employee
    
  end
end

client = DBEngine.new
