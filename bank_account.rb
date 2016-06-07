class BankAccount
  attr_reader :name

  def initialize(name)
    @name = name
    @transactions = Array.new
    add_transaction("Beginning Balance", 0)
  end

  def add_transaction(description, amount)
    @transactions.push(description: description, amount: amount)
  end

  def balance
    balance = 0
    @transactions.each do |transaction|
      balance += transaction[:amount]
    end
    return balance
  end

  def print_register
    puts "#{name}'s Bank Account, Balance: #{balance}"
    puts "Description\tAmount"

    @transactions.each do |transaction|
      puts transaction[:description].ljust(30) + transaction[:amount].to_s.rjust(10)
    end
  end

end

bank_account = BankAccount.new('Miguelo')

bank_account.add_transaction("Groceries", 45.33)
bank_account.add_transaction("iShop", 1000.44)

bank_account.print_register
