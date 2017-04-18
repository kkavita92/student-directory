COHORTS = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december]

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  @students = []
  name = gets.chomp #get the first name
  while !name.empty? do
    get_cohort(name)
    singular(@students)
    name = gets.chomp #get another name from user
  end
  @students
end

def get_cohort(name) #get cohort as input
  puts "Which cohort is #{name} from?"
  @cohort = gets.chomp
  if COHORTS.include?(@cohort.downcase.to_sym)
    @students << {name: name, cohort: @cohort.downcase.to_sym}
  else
    puts "Incorrect input. We will assume cohort is unknown."
    @students << {name: name, cohort: "Unknown"}
  end
end

def singular(names)
  if names.size == 1
    puts "Now we have 1 student. Add more?"
  else
    puts "Now we have #{names.count} students."
  end
end

def print_header
  puts "The students of Villains Academy".center(75,'~')
  puts "-------------".center(75)
  puts #spacing in between header and student data
end

def print_by_cohort(names)
  months = names.map{|name| name[:cohort] }.uniq.sort_by{|x| COHORTS.index(x)}
  months.each do |month|
    puts "#{month.to_s.capitalize}:".center(75) #heading for each cohort
    spec_cohort = []
    names.each do |name|
      if name[:cohort] == month
        puts "#{name[:name]}".center(75)
        spec_cohort << name #to count how many people are in each cohort
      end
    end
    puts "(#{spec_cohort.size.to_s})".center(75) #prints people in each cohort
    puts #spacing between output of each cohort 
  end
end

def print_with_index(names)
  names.each_with_index do |student,index|
    puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students.".center(75)
end

students = input_students
print_header
print_by_cohort(students)
print_footer(students)
