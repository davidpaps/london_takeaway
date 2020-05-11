# frozen_string_literal: true

class Order
  attr_reader :basket, :menu, :message

  def initialize(menu = Menu.new, message = Message.new)
    @menu = menu
    @message = message
    @basket = {}
  end

  def select_items(item, quantity = 1)
    if exist_in_menu?(item)
      if !exist_in_basket?(item)
        basket[item.to_sym] = quantity
        "#{quantity} x #{item.capitalize} Added, Total = £#{calculate_total}"
      else
        basket[item.to_sym] += quantity
        "#{basket[item.to_sym]} x #{item.capitalize} Added, Total = £#{calculate_total}"
      end
    else
      raise "No #{item.capitalize} Avaliable!"
    end
  end

  def calculate_total
    total = basket.map do |item, quantity|
      menu.show_price(item) * quantity
    end
    total.reduce(:+)
  end

  def complete_order
    order_total = basket.map do |item, quantity|
      "#{quantity} x #{item.capitalize}"
    end
    message.send
    'Order = ' + order_total.join(', ') + ", Total = £#{calculate_total}"
  end

  private

  def exist_in_menu?(item)
    menu.items.key?(item.to_sym)
  end

  def exist_in_basket?(item)
    basket.key?(item.to_sym)
  end
end
