def get_name()
  print "Enter your name: "
  return gets.chomp
end

def green(name)
  puts "Hi #{name}!"
  if (name == 'Jason')
    puts "That's a great name"
  end
end

def get_number()
  print "Whats number would you like to test?: "
  return gets.chomp.to_i
end

def divisible_by_3?(number)
  return (number % 3 == 0)
end

name = get_name()
green(name)
number = get_number();

if divisible_by_3?(number)
  puts "Your number is divisible by 3!"
else
  puts "Your number is not divisible by 3!"
end

