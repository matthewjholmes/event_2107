class Event

  attr :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(truck)
    @food_trucks << truck
  end

  def food_truck_names
    @food_trucks.map do |truck|
      truck.name
    end
  end

  def food_trucks_that_sell(item)
    nom_nom_sources = []
    @food_trucks.each do |truck|
      if truck.inventory.include?(item)
        nom_nom_sources << truck
      end
    end
    nom_nom_sources
  end

  def total_inventory
    tot_inventory = Hash.new({})
    @food_trucks.each do |truck|
      truck.inventory.each do |item, quant|
        tot_inventory[item] ||= {}
        tot_inventory[item] = {quantity: quant, food_trucks: food_trucks_that_sell(item)}
      end
    end
    tot_inventory
  end

  def overstocked_items
    total_inventory.map do |item, data|
      if data[:quantity] > 50 && data[:food_trucks].count > 1
        item
      end
    end
  end

  def sorted_item_list
    items = []
    @food_trucks.each do |truck|
      truck.inventory.each do |item, quantity|
        items << item
      end
    end
    items.map do |item|
      item.name
    end.uniq.sort
  end
end
