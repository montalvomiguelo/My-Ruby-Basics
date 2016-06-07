def get_name
  print "Enter your name: "
  name = gets.chomp
  # pass the name variable as argument of the block
  yield name
  name
end

miguelo = get_name do |name|
  puts "Tha's a cool name, #{name}"
end

puts miguelo.inspect

