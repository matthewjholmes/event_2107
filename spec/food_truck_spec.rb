require './lib/item'
require './lib/food_truck'

RSpec.describe do
  before(:each) do
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
  end

  it 'exists and has attr' do
    expect(@food_truck.name).to eq("Rocky Mountain Pies")
    expect(@food_truck.inventory).to eq({})
  end

  it 'checks stock' do
    expect(@food_truck.check_stock(@item1)).to eq(0)
  end

  it 'can stock items and check inventory' do
    @food_truck.stock(@item1, 30)

    expect(@food_truck.inventory).to eq({@item1 => 30})
    expect(@food_truck.check_stock(@item1)).to eq(30)

    @food_truck.stock(@item1, 25)

    expect(@food_truck.check_stock(@item1)).to eq(55)

    @food_truck.stock(@item2, 12)

    expect(@food_truck.inventory).to eq({@item1 => 55, @item2 => 12})
  end

  it 'calcs potential_revenue' do
    @food_truck.stock(@item1, 30)
    @food_truck.stock(@item1, 25)
    @food_truck.stock(@item2, 12)

    expect(@food_truck.potential_revenue).to eq(236.25)
  end
end
