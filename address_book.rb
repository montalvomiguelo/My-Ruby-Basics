require "./contact"
require "yaml"

class AddressBook
  attr_reader :contacts

  def initialize
    @contacts = Array.new
  end

  def print_contact_list
    contacts.each do |contact|
      puts contact.to_s
      contact.print_phone_numbers
      contact.print_addresses
    end
  end

  def add_contact
    print "First name: "
    first_name = gets.chomp
    print "Middle name: "
    middle_name = gets.chomp
    print "Last name: "
    last_name = gets.chomp

    contact = Contact.new(first_name, middle_name, last_name)

    loop do
      print "Add phone number? (y/n) "
      answer = gets.chomp.downcase

      if answer == "n"
        break
      elsif answer == "y"
        print "Enter kind number: "
        kind_number = gets.chomp
        print "Enter phone number: "
        phone_number = gets.chomp
        contact.add_phone_number({ kind_number => phone_number })
      else
        break
      end
    end

    loop do
      print "Add address? (y/n) "
      answer = gets.chomp.downcase

      if answer == "n"
        break
      elsif answer == "y"
        print "Enter kind address: "
        kind_address = gets.chomp
        print "Enter address: "
        address = gets.chomp
        contact.add_address({ kind_address => address })
      else
        break
      end
    end

    contacts.push(contact)
  end

  def find_by_name(name)
    results = []
    search = name.downcase
    contacts.each do |contact|
      if contact.first_name.downcase.include?(search)
        results.push(contact)
      end
    end
    yield results, name
  end

  def find_by_phone_number(number)
    results = []
    search = number.gsub("-", "")
    contacts.each do |contact|
      for phone in contact.phone_numbers
        if phone.any? { |key, value| value.gsub("-", "").include?(search) }
          results.push(contact) unless results.include?(contact)
        end
      end
    end
    yield results, number
  end

  def print_results(results)
    for contact in results
      puts contact
      contact.print_phone_numbers
      contact.print_addresses
    end
  end

  def finder
    puts "Find by:"
    puts "n: Name"
    puts "p: Phone Number"
    print "Enter your choice: "
    answer = gets.chomp.downcase
    case answer
    when "n"
      print "Enter name: "
      name = gets.chomp.downcase
      find_by_name(name) do |results, query|
        puts "#{results.length} results for #{query}"
        print_results(results)
      end
    when "p"
      print "Enter phone number: "
      phone_number = gets.chomp.downcase
      find_by_phone_number(phone_number) do |results, query|
        puts "#{results.length} results for #{query}"
        print_results(results)
      end
    end
  end

  def open
    if File.exist?("contacts.yml")
      @contacts = YAML.load_file("contacts.yml")
    end
  end

  def save
    File.open("contacts.yml", "w") do |file|
      file.write(contacts.to_yaml)
    end
  end

  def run
    open

    loop do
      puts "Address Book"
      puts "a: Add Contact"
      puts "d: Delete Contact"
      puts "p: Print Address Book"
      puts "f: Finder"
      puts "e: Exit"
      print "Enter your choice: "
      input = gets.chomp.downcase
      case input
      when "e"
        save
        break
      when "a"
        add_contact
      when "p"
        print_contact_list
      when "f"
        finder
      when "d"
        delete
      end
    end
  end

  def delete
    print "Enter Phone Number: "
    phone_number = gets.chomp

    find_by_phone_number(phone_number) do |results, query|
      for contact in results
        delete_contact(contact)
      end
    end
  end

  def delete_contact(contact)
    print "Delete #{contact}? (y/n) "
    answer = gets.chomp
    if answer == "y"
      contacts.delete(contact)
    end
  end

end

address_book = AddressBook.new
address_book.run
