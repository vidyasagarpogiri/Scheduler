class Employee
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