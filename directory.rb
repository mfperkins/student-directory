students_old = [
  {name: "Dr. Hannibal Lecter", cohort: :november, country: :USA, hobby: "Eating", height: 180, weight: 90},
  {name: "Darth Vader", cohort: :august, country: :Empire, hobby: "Light Sabering", height: 190, weight: 92},
  {name: "Nurse Ratched", cohort: :january, country: :USA, hobby: "Nursing", height: 157, weight: 56},
  {name: "Michael Corleone", cohort: :november, country: :NYC, hobby: "Pizza making", height: 190, weight: 120},
  {name: "Alex DeLarge", cohort: :november, country: :USA, hobby: "Cards", height: 182, weight: 87},
  {name: "The Wicked Witch of the West", cohort: :january, country: :Oz, hobby: "Cackling", height: 165, weight: 64},
  {name: "Terminator", cohort: :november, country: :Skynet, hobby: "I'll be back", height: 201, weight: 110},
  {name: "Freddy Krueger", cohort: :september, country: :USA, hobby: "Slashing", height: 193, weight: 96},
  {name: "The Joker", cohort: :november, country: :Gotham, hobby: "Destroying", height: 178, weight: 76},
  {name: "Joffrey Baratheon", cohort: :september, country: :Westeros, hobby: "Screeching", height: 136, weight: 52},
  {name: "Norman Bates", cohort: :august, country: :England, hobby: "Chess", height: 156, weight: 60}
]

@students = []

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save students"
  puts "9. Exit"
end

def show_students
  print_student_list(@students)
  print_footer(@students)
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |name|
    student_data = [name[:name], name[:cohort], name[:country], name[:hobby], name[:height], name[:weight]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def process(selection)
  case selection
  when "1"
    @students = input_students
  when "2"
    show_students
  when "3"
    save_students
  when "9"
    exit
  else
    puts "I don't know what that means. Try again."
  end
end

def interactive_menu
  puts "What would you like to do?"
  puts "Your options are:"
  puts

  loop do
    print_menu
    process(gets.chomp)
  end
end

def input_students
  puts "Please enter name of the student."

  name = gets.chomp.capitalize

  while !name.empty? do

    puts "What cohort is #{name} in?"
    cohort = gets.chomp.capitalize.to_sym
    if cohort.empty? == true
      cohort = :november
    end

    puts "What country is #{name} from?"
    country = gets.chomp.capitalize

    puts "What is #{name}'s favourite hobby?"
    hobby = gets.chomp

    puts "What tall is #{name} in cm?"
    height = gets.chomp

    puts "And finally, how much does #{name} weigh in kgs?"
    weight = gets.chomp

    @students.push({name: name, cohort: cohort, country: country, hobby: hobby, height: height, weight: weight})

    if @students.count > 1
      puts "Now we have #{@students.count} students."
    else
      puts "Now we have #{@students.count} student."
    end
    puts "Enter another student's name or hit ENTER to finish"
    name = gets.chomp.capitalize

  end
  @students
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

def print_length(names)
  names.each.with_index(1) do |name, index|
    if name[:name].length > 12
      puts "#{index}. #{name[:name]} (#{name[:cohort].capitalize} cohort ) (Height: #{name[:name]} ) (Weight: #{name[:weight]} )(Born: #{name[:country]} ) (Hobby: #{name[:hobby]})"
    end
  end
end

def find_lengths names
  $longest_string = 1
  $length_1st_section = 1
  $length_2nd_section = 1
  $length_3rd_section = 1

  names.each do |name|

    section_1 = "#{name[:name]} (#{name[:cohort].capitalize} cohort)"
    section_2 = "Height: #{name[:height]}cm, Weight: #{name[:weight]}kgs"
    section_3 = "Born: #{name[:country]} // Hobby: #{name[:hobby]}"

    if name.to_s.length.to_i > $longest_string
      $longest_string = name.to_s.length.to_i
    end

    if section_1.length > $length_1st_section
      $length_1st_section = section_1.length
    end

    if section_2.length > $length_2nd_section
      $length_2nd_section = section_2.length
    end

    if section_3.length > $length_3rd_section
      $length_3rd_section = section_3.length
    end

  end

end


def print_student_list(names)

  find_lengths(names)

  puts "The Students of Awesomeness Academy"
  puts "-" * ($longest_string.to_i+13)

  names.each.with_index(1) do |name, index|
      section_1 = "#{name[:name]} (#{name[:cohort].capitalize} cohort)"
      section_2 = "Height: #{name[:height]}cm, Weight: #{name[:weight]}kgs"
      section_3 = "Born: #{name[:country]} // Hobby: #{name[:hobby]}"
      puts "#{index}.".center(3) + " " + section_1.center($length_1st_section.to_i) + " // " + section_2.center($length_3rd_section.to_i) + " // " + section_3.center($length_3rd_section.to_i)
  end

end

def print_footer(names)
  if names.count > 1
    puts
    puts "Overall, we have #{names.count} great students."
  else
    puts
    puts "Overall, we have #{names.count} great student."
  end
end

puts
interactive_menu
puts
