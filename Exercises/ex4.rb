def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp #get the first name
  while !name.empty? do
    students << {name: name, cohort: :november} #value of cohort is hardcoded
    puts "Now we have #{students.count} students"
    name = gets.chomp #get another name from user
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_with_while_loop(names)
  count = 0
  while count < names.size
     puts "#{count+1}. #{names[count][:name]} (#{names[count][:cohort]} cohort)"
     count += 1
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students."
end

students = input_students
print_header
print_with_while_loop(students)
print_footer(students)
