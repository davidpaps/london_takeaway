class Order

  attr_reader :basket, :menu

  def initialize(menu = Menu.new())
    @menu = menu
    @basket = {}
  end

  def select_items(item, quantity = 1)
    if menu.items.has_key?(item.to_sym)
      if !basket.has_key?(item.to_sym)
        basket[item.to_sym] = quantity 
      else  
        basket[item.to_sym] += quantity
      end
    else
      raise "No #{item.capitalize} Avaliable!"
    end
  end

end

