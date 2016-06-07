#class Customer
  #attr_accessor :name, :email

  #def initialize(name, email)
    #@name = name
    #@email = email
  #end
#end

#miguelo = Customer.new("Miguelo", "me@montalvomiguelo.com")

Customer = Struct.new(:name, :email) do
  # If there are too many methods here use a real class instead
  def name_with_email
    "#{name} : #{email}"
  end
end

miguelo = Customer.new("Miguelo", "me@montalvomiguelo.com")
miguelo.each_pair { |name, value| puts "#{name} => #{value}" }
