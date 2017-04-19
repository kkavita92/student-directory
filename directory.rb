COHORTS = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december,"unknown"]
@students = []

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit"
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp) #argument is whatever user inputs
  end
end

def process(selection)
  case selection
  when "1"
    students = input_students
  when "2"
    print_output
  when "3"
    save_students
  when "9"
  else
    puts "I don't know what you meant, try again"
  end
end

def save_students
  file = File.open("students.csv","w")
  @students.each do |student|
    student_data = [student[:name],student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
    file.close
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = gets.chomp #get the first name
  while !name.empty? do
    get_cohort(name)
    singular
    name = gets.chomp #get another name from user
  end
end

def get_cohort(name) #get cohort as input
  puts "Which cohort is #{name} from?"
  cohort = gets.chomp
  if COHORTS.include?(cohort.downcase.to_sym)
    @students << {name: name, cohort: cohort.downcase.to_sym}
  else
    puts "Incorrect input. We will assume cohort is unknown."
    @students << {name: name, cohort: "unknown"}
  end
end

def singular
  if @students.size == 1
    puts "Now we have 1 student. Add more?"
  else
    puts "Now we have #{@students.count} students."
  end
end

def print_header
  puts "The students of Villains Academy".center(75,'~')
  puts "-------------".center(75)
  puts #spacing in between header and student data
end

def print_students_by_cohort
  months = @students.map{|name| name[:cohort] }.uniq.sort_by{|x| COHORTS.index(x)}
  months.each do |month|
    puts "#{month.to_s.capitalize}:".center(75) #heading for each cohort
    spec_cohort = []
    @students.each do |name|
      if name[:cohort] == month
        puts "#{name[:name]}".center(75)
        spec_cohort << name #to count how many people are in each cohort
      end
    end
    puts "(#{spec_cohort.size.to_s})".center(75) #prints people in each cohort
    puts #spacing between output of each cohort
  end
end

def print_with_index
    @students.each_with_index do |student,index|
      puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
end

def print_footer
  puts "Overall, we have #{@students.count} great students.".center(75)
end

def print_output
  if @students.empty?
    puts "No input provided!"
  else
    print_header
    print_students_by_cohort
    print_footer
  end
end

interactive_menu
