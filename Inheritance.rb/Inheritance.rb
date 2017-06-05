class Employee
  attr_reader :salary
  def initialize(name,title,salary,boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    bonus = @salary * multiplier
  end
end

class Manager < Employee
  def initialize(name, title, salary, boss, employees)
    super(name, title, salary, boss)
    @employees = employees
  end

  def bonus(multiplier)
    multiplier * (@employees.map{|el| el.salary}.reduce(:+))
  end


end


shawna = Employee.new("Shawna","TA",12000,"Darren")
david = Employee.new("David","TA",10000,"Darren")
darren = Manager.new("Darren","TA Manager",78000,"Ned", [shawna, david])
ned = Manager.new("Ned","Founder",1000000,nil, [darren, shawna, david])
p ned.bonus(5)
p darren.bonus(4)
p david.bonus(3)
