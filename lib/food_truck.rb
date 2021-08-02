class FoodTruck

  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    @inventory[item]
  end

  def stock(item, quantity)
    @inventory[item] ||= 0
      @inventory[item] += quantity
  end

  def potential_revenue
    sum = 0
    @inventory.each do |item, quantity|
      sum += item.price * quantity
    end
    sum
  end
end
