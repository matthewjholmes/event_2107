class Item

  attr :name

  def initialize(params)
    @name = params[:name]
    @price = params[:price]
  end

  def price
    @price.delete("$").to_f.round(2)
  end
end
