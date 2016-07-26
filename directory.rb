students_old = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]

def input_students
  puts "Please enter names of the students."
  puts "To finish, just hit return twice."

  students = []
  name = gets.chomp

  while !name.empty? do
    students.push({name: name, cohort: :november})
    puts "Now we have #{students.count} students."
    name = gets.chomp
  end
  students
end

def print_header
  puts "The Students of Awesomeness Academy"
  puts "-----------------"
end

def print(names)
  names.each do |name|
    puts "#{name[:name]} (#{name[:cohort].capitalize} cohort)"
  end
end

def print_footer(names)
  puts
  puts "Overall, we have #{names.count} great students."
end

puts
students = input_students
print_header
print(students)
print_footer(students)
puts
