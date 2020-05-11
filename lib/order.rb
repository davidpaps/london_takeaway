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
        return "#{quantity} x #{item.capitalize} Added, Total = £#{calculate_total}"
      else  
        basket[item.to_sym] += quantity
        return "#{basket[item.to_sym]} x #{item.capitalize} Added, Total = £#{calculate_total}"
      end
    else
      raise "No #{item.capitalize} Avaliable!"
    end
  end

  def calculate_total
    total = basket.map do |item, quantity| 
      menu.show_price(item) * quantity
  end
    return total.reduce(:+)
end

end

