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

def print_with_index(names)
  filter_by(names).each_with_index do |student,index|
      puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def filter_by(names)
  names.select {|student| student[:name].start_with?("T") || student[:name].start_with?("t")}
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students but only #{filter_by(names).count} have names starting with a 'T'"
end

print_header
print_with_index(students)
print_footer(students)
