class Contact
  attr_reader :first_name, :middle_name, :last_name, :phone_numbers, :addresses

  def initialize(first_name, middle_name, last_name)
    @first_name = first_name
    @middle_name = middle_name
    @last_name = last_name
    @phone_numbers = Array.new
    @addresses = Array.new
  end

  def add_phone_number(phone)
    phone_numbers.push(phone)
  end

  def first_last
    "#{first_name} #{last_name}"
  end

  def last_first
    last_first = last_name
    last_first += ", #{first_name}"
    unless middle_name.empty?
      last_first += " #{middle_name.slice(0, 1)}."
    end
    last_first
  end

  def full_name
    full_name = first_name
    unless middle_name.empty?
      full_name += " #{middle_name}"
    end
    full_name += " #{last_name}"
    full_name
  end

  def to_s(format = 'full_name')
    case format
    when 'full_name'
      full_name
    when 'last_first'
      last_first
    when 'first'
      first_name
    when 'last'
      last_name
    else
      first_last
    end
  end

  def print_phone_numbers
    puts "Phone Numbers"
    phone_numbers.each {|phone_number| puts phone_number}
  end

  def add_address(address)
    addresses.push(address)
  end

  def print_addresses
    puts "Addresses"
    addresses.each {|address| puts address}
  end

end
