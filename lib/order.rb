class Order

  attr_reader :basket

  def initialize(menu = Menu.new(items))
    @menu = menu
    @basket = {}
  end

  def select_items(item, quantity)
    basket[item.to_sym] = quantity
  end

end