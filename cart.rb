class Cart
  def initialize
    @items = []
  end

  def add_item(title, price)
    @items.push(title: title, price: price)
  end

  def total_price
    total_price = 0
    @items.each do |item|
      total_price += item[:price]
    end
    return total_price
  end
end

shopping_cart = Cart.new

shopping_cart.add_item('iPhone 6s', 100)
shopping_cart.add_item('iPad', 70)

puts shopping_cart.total_price
