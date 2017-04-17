COHORTS = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december]

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp #get the first name
  while !name.empty? do
    puts "Which cohort is #{name} from?"
    cohort = gets.chomp
    if COHORTS.include?(cohort.downcase.to_sym)
      students << {name: name, cohort: cohort.downcase.to_sym}
    else
      puts "Incorrect input. We will assume cohort is unknown."
      students << {name: name, cohort: "Unknown"}
    end
    singular_manager(students)
    name = gets.chomp #get another name from user
  end
  students
end

def singular_manager(names)
  if names.size == 1
    puts "Now we have 1 student. Add more?"
  else
    puts "Now we have #{names.count} students."
  end
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
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print_with_index(students)
print_footer(students)
