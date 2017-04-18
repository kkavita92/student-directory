def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
   #create an empty array
  students = []
   #get the first name
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print_list(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end


students = input_students
print_header
print_list(students)
print_footer(students)
