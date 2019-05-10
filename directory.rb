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
  puts "Please enter the names of the students, then their hobbies, separated by a comma"
  puts "To finish, just hit return twice"

  students = []

  input = gets.chomp

  until input.empty? do
    student = input.split(',', 2).map(&:lstrip)
    puts student
    students << {name: student[0], cohort: :november, hobbies: student[1]}
    puts "Now we have #{students.count} students"
    input = gets.chomp
  end

  students
end
  

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each.with_index { |student, index| puts "#{index + 1}: #{student[:name]} (#{student[:cohort]} cohort). Hobbies include: #{student[:hobbies]}"}
end

def print_footer(names)
  puts "Overall, we have #{names.count} excellent students"
end

students = input_students
print_header
print(students)
print_footer(students)