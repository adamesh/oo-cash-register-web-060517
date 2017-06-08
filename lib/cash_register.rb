
class CashRegister

  attr_accessor :total, :discount

  def initialize(discount = nil)
    self.discount = discount
    self.total = 0
    self.items = []
  end

  def add_item(title, price, quantity = 1)
    self.total += (price * quantity)
    quantity.times do
      self.items << title
    end
    self.last_transaction = {title => price}
  end

  def apply_discount
    if self.discount
      self.total -= self.total * discount / 100
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    self.items
  end

  def void_last_transaction
    self.total -= self.last_transaction[self.items.last]
  end
end
