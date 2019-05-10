student_count = 11
students = [
   {name: "Dr Hannibal Lecter", cohort: :november, hobbies: "Murder, cannibalism, mind tricks"},
   {name: "Darth Vader", cohort: :november, hobbies: "Lightsaber practice"},
   {name: "Nurse Ratched", cohort: :november, hobbies: "Something"},
   {name: "Michael Corleone", cohort: :november, hobbies: "Something else"},
   {name: "Alex DeLarge", cohort: :november, hobbies: "None"},
   {name: "The Wicked Witch of the West", cohort: :november, Hobbies: "Witchery"},
   {name: "Terminator", cohort: :november, hobbies: "Being awesome"},
   {name: "Freddy Krueger", cohort: :november, hobbies: "Dunno"},
   {name: "The Joker", cohort: :november, hobbies: "Facepaint"},
   {name: "Joffrey Baratheon", cohort: :november, hobbies: "Being rubbish"},
   {name: "Norman Bates", cohort: :november, hobbies: ""}
]

def input_students
  puts_centered("Please enter the names of the students, then their cohort, then their hobbies, separated by a comma")
  puts_centered("To finish, just hit return twice")

  students = []

  input = gets.chomp

  until input.empty? do
    student = input.split(',', 3).map(&:lstrip)
    unless student.length < 3 
      students << {name: student[0], cohort: student[1].to_sym, hobbies: student[2]}
      puts_centered("Now we have #{students.count} #{students.count > 1 ? 'students' : 'student'}.")
    else
      puts_centered("You didn't input the right number of things! Try again")
    end
    input = gets.chomp
  end

  students
end
  

def print_header
  puts_centered("The students of Villains Academy")
  puts_centered("-------------")
end

def print_list(students)
  puts_centered("Student list:")
  students.each.with_index { |student, index| puts_centered("#{index + 1}: #{student[:name]} (#{student[:cohort]} cohort). Hobbies include: #{student[:hobbies]}")}
end

def print_by_cohort(students)
  puts_centered("Students by cohort:")
  cohorts = students.map { |student| student[:cohort] }
  cohorts.each do |cohort|
    puts_centered("#{cohort} cohort:")
    students.filter { |student| student[:cohort] == cohort }.each.with_index { |student, index| puts_centered("#{index + 1}: #{student[:name]}. Hobbies include: #{student[:hobbies]}")}
  end
end

def print_footer(students)
  puts_centered("Overall, we have #{students.count} excellent students")
end

def puts_centered(text)
  puts text.slice!(0, 50).center(75) while text.length > 0
end

def interactive_menu
  students = []
  loop do
    puts_centered("1. Input the students")
    puts_centered("2. Show the students")
    puts_centered("9. Exit")
    selection = gets.chomp

    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print_list(students)
      print_by_cohort(students)
      print_footer(students)
    when "9"
      exit
    else
      puts_centered("I don't know what you meant, try again")
    end

  end
end

interactive_menu