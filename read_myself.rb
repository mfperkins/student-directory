def read_myself
  puts
  puts "You are currently looking at #{$0}. Here are it's contents:"
  puts
  puts "*" * 75
  file = File.open($0, "r") do |data|
    data.readlines.each do |line|
      puts line
    end
  end
  puts  "*" * 75
  puts

end

read_myself
