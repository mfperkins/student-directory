@students = []

def try_load_students
  filename = ARGV.first #1st argument from the command line
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}."
  else
    puts "Sorry, #{filename}, doesn't exist"
    exit
  end
end

try_load_students

def push_to_arr data
  data.push({name: name, cohort: cohort, country: country, hobby: hobby, height: height, weight: weight})
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort, country, hobby, height, weight = line.chomp.split(",")
    @students.push({name: name, cohort: cohort.to_sym, country: country, hobby: hobby, height: height, weight: weight})
  end
  file.close
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
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

def options(selection)
  case selection
  when "1"
    @students = input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
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
    options(STDIN.gets.chomp)
  end
end

def input_students
  puts "Please enter name of the student."

  name = STDIN.gets.chomp.capitalize

  while !name.empty? do

    puts "What cohort is #{name} in?"
    cohort = STDIN.gets.chomp.capitalize.to_sym
    if cohort.empty? == true
      cohort = :november
    end

    puts "What country is #{name} from?"
    country = STDIN.gets.chomp.capitalize

    puts "What is #{name}'s favourite hobby?"
    hobby = STDIN.gets.chomp

    puts "What tall is #{name} in cm?"
    height = STDIN.gets.chomp

    puts "And finally, how much does #{name} weigh in kgs?"
    weight = STDIN.gets.chomp

    @students.push({name: name, cohort: cohort, country: country, hobby: hobby, height: height, weight: weight})

    if @students.count > 1
      puts "Now we have #{@students.count} students."
    else
      puts "Now we have #{@students.count} student."
    end
    puts "Enter another student's name or hit ENTER to finish"
    name = STDIN.gets.chomp.capitalize
  end
  @students
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
