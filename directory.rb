# students = [
#    {name: "Dr Hannibal Lecter", cohort: :november, hobbies: "Murder, cannibalism, mind tricks"},
#    {name: "Darth Vader", cohort: :november, hobbies: "Lightsaber practice"},
#    {name: "Nurse Ratched", cohort: :november, hobbies: "Something"},
#    {name: "Michael Corleone", cohort: :november, hobbies: "Something else"},
#    {name: "Alex DeLarge", cohort: :november, hobbies: "None"},
#    {name: "The Wicked Witch of the West", cohort: :november, Hobbies: "Witchery"},
#    {name: "Terminator", cohort: :november, hobbies: "Being awesome"},
#    {name: "Freddy Krueger", cohort: :november, hobbies: "Dunno"},
#    {name: "The Joker", cohort: :november, hobbies: "Facepaint"},
#    {name: "Joffrey Baratheon", cohort: :november, hobbies: "Being rubbish"},
#    {name: "Norman Bates", cohort: :november, hobbies: ""}
# ]

@students = []

def input_students
  puts_centered("Please enter the names of the students, then their cohort, then their hobbies, separated by a comma")
  puts_centered("To finish, just hit return twice")

  input = gets.chomp

  until input.empty? do
    student = input.split(',', 3).map(&:lstrip)
    unless student.length < 3 
      @students << {name: student[0], cohort: student[1].to_sym, hobbies: student[2]}
      puts_centered("Now we have #{@students.count} #{@students.count > 1 ? 'students' : 'student'}.")
    else
      puts_centered("You didn't input the right number of things! Try again")
    end
    input = gets.chomp
  end

end
  

def print_header
  puts_centered("The students of Villains Academy")
  puts_centered("-------------")
end

def print_list
  puts_centered("Student list:")
  @students.each.with_index { |student, index| puts_centered("#{index + 1}: #{student[:name]} (#{student[:cohort]} cohort). Hobbies include: #{student[:hobbies]}")}
end

def print_by_cohort
  puts_centered("Students by cohort:")
  cohorts = @students.map { |student| student[:cohort] }
  cohorts.each do |cohort|
    puts_centered("#{cohort} cohort:")
    @students.filter { |student| student[:cohort] == cohort }.each.with_index { |student, index| puts_centered("#{index + 1}: #{student[:name]}. Hobbies include: #{student[:hobbies]}")}
  end
end

def print_footer
  puts_centered("Overall, we have #{@students.count} excellent #{@students.count > 1 ? 'students' : 'student'}.")
end

def puts_centered(text)
  puts text.slice!(0, 50).center(75) while text.length > 0
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "9"
    exit
  else
    puts_centered("I don't know what you meant, try again")
  end
end

def print_menu
  puts_centered("1. Input the students")
  puts_centered("2. Show the students")
  puts_centered("3. Save the list to students.csv")
  puts_centered("9. Exit")
end

def show_students
  print_header
  print_list
  print_by_cohort
  print_footer
end

def save_students
  file = File.open("students.csv", "w")
  @students.each { |student| file.puts(student.to_s) }
  file.close
end

interactive_menu