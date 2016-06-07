contact_list = Array.new

def ask(question, kind="string")
  print question + " "
  answer = gets.chomp
  answer = answer.to_i if kind == "number"
  return answer
end

def add_contact
  contact = {"name" => "", "phone_numbers" => []}
  contact["name"] = ask("Whats is your name?")
  answer = ""
  until answer == "n"
    answer = ask("Do you want to add a phone number? (y/n)")
    if answer == "y"
      phone = ask("Enter a phone number:")
      contact["phone_numbers"].push(phone)
    end
  end
  return contact
end

answer = ""
while answer != "n"
  contact_list.push(add_contact())
  answer = ask("Do you want to add a contact? (y/n)")
end

contact_list.each do |contact|
  name = contact["name"]
  phone_numbers = contact["phone_numbers"]
  puts "Name: \n\t#{name}"
  if phone_numbers.count > 0
    puts "Phone Numbers:"
    phone_numbers.each do |phone|
      puts "\t #{phone}"
    end
  end
end
