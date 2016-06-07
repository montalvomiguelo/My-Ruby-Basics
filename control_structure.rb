print "Enter name: "
name = gets.chomp

if name == 'Miguel'
  puts "Cool #{name}, That's my name, too!"
else
  puts "Hi #{name}!"
end

option = 2

case option
  when 1
    puts 'Uno'
  when 2
    puts 'Dos'
  when 3
    puts 'Tres'
end
