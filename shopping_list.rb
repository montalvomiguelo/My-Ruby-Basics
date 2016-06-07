def create_list
  print "What is the list name? "
  name = gets.chomp

  hash = { "name" => name, "items" => Array.new }
  return hash
end

def add_list_item
  print "What is the item called? "
  name = gets.chomp

  print "How many? "
  quantity = gets.chomp

  hash = { "name" => name, "quantity" => quantity }
  return hash
end

def print_separator(character)
  puts character * 23
end

def print_list(list)
  puts "List: #{list['name']}"
  print_separator('-')

  list["items"].each do |item|
    puts "Item: " + item['name']
    puts "Quantity: " + item['quantity'].to_s
    print_separator('-')
  end
end

list = create_list()
list['items'].push(add_list_item())
print_list(list)
