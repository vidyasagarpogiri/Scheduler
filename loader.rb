#the following will load the current week / schedule.
class Loader
  def initialize
    @date = DateTime.now #get current date
    if @date.cwday === 7 #if its sunday, we're fresh
      @fresh = true
    else
      @fresh = false
    end
  end
  def weekday
    @date.cwday
  end
  def mdate
    @date.day
  end
  def spawn_buttons
    btns = []
    if @fresh === true
      0.upto(6) do |x|
        tmp = x + @date.day
        btns.push("#{$DAYS[x]} #{tmp}")
      end
    else
      sundate = @date.day - @date.cwday
      0.upto(6) do |x|
        tmp = x+sundate
        btns.push("#{$DAYS[x]} #{tmp}")
      end
    end
    btns
  end
  #for now, the employees will just be a .txt file, separated by columns
  def load_employees
    employees = []
    path = "employees.txt"
    fd = File.open(path, "r")
    fd.each_line do |line|
      emp = {}
      a = line.split
      name = a[0]
      emp[:name] = name
      emp[:mon] = a[1]
      emp[:tue] = a[2]
      emp[:wed] = a[3]
      emp[:thu] = a[4]
      emp[:fri] = a[5]
      emp[:sat] = a[6]
      emp[:sun] = a[7]
      employees.push(emp)
    end
    employees
  end
end