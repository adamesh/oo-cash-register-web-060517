
class CashRegister

  attr_accessor :total, :discount

  def initialize(discount = nil)
    @discount = discount
    @total = 0
    @items = []
  end

  def add_item(title, price, quantity = 1)
    @total += (price * quantity)
    quantity.times do
      @items << title
    end
    @last_transaction = {title => price}
  end

  def apply_discount
    if @discount
      @total -= @total * discount / 100
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total -= @last_transaction[@items.last]
  end
end
