random_number = Random.new.rand(5)
loop do
  print "Guess the number between 0 and 5 (e to exit): "
  answer = gets.chomp
  if answer == "e"
    puts "the number was #{random_number}."
    break
  else
    if answer.to_i == random_number
      puts "You gessed correctrly!"
      break
    else
      puts "Try again."
    end
  end
end
