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

def print_if_letter(names)
  puts "This option allows you to print students whose name begins with a specific letter"
  puts "What letter would you like to select?"
  answer = gets.chomp.upcase
  puts "Ok, this is what I've got ..."
  names.each.with_index(1) do |name, index|
    if name[:name][0] == answer
      puts "#{index}. #{name[:name]} (#{name[:cohort].capitalize} cohort)"
    end
  end
end


def print_while(names)
  count = 0
  while count != names.count
    puts "#{names[count][:name]} (#{names[count][:cohort].capitalize} cohort)"
    count += 1
  end
end

def print_header
  puts "The Students of Awesomeness Academy"
  puts "-----------------"
end

def print(names)
  names.each.with_index(1) do |name, index|
    if name[:name].length > 12
      puts "#{index}. #{name[:name]} (#{name[:cohort].capitalize} cohort)"
    end
  end
end


def print_footer(names)
  puts
  puts "Overall, we have #{names.count} great students."
end

puts
# students = input_students
print_header
print_while(students_old)
print_footer(students_old)
puts
