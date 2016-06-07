def get_name(prompt, &block)
  print "#{prompt}: "
  name = gets.chomp
  print "Age: "
  age = gets.chomp

  # pass multiple variables to the block as arguments
  block.call(name, age) if block_given? # call the block if a block was sent to a method, keyworkd block_given?
  # yield name, age

end

miguelo = get_name("Enter your name") do |name, age|
  puts "Tha's a cool name, #{name}"
  puts "Viejito de #{age} años"
end

pitufo = get_name("Nombre")

