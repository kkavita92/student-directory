def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp #get the first name
  while !name.empty? do
    students << {name: name, cohort: :november} #value of cohort is hardcoded
    if students.size == 1
      puts "Now we have 1 student. Add more?"
    else
      puts "Now we have #{students.count} students."
    end
    name = gets.chomp #get another name from user
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_with_index(names)
  names.each_with_index do |student,index|
    puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  if names.size == 1
    puts "Seems to be a small cohort - only 1 student."
  else
    puts "Overall, we have #{names.count} great students."
end

stuents = input_students
print_header
print_with_index(students)
print_footer(students)
