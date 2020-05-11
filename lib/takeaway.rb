# frozen_string_literal: true

require_relative 'order'

class Takeaway
  attr_reader :order

  def initialize(order = Order.new)
    @order = order
  end

  def view_menu
    order.menu.show_menu
  end

  def order_item(item, quantity = 1)
    order.select_items(item, quantity)
  end

  def finalise_order
    order.complete_order
  end
end
