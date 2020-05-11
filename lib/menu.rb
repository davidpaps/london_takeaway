# frozen_string_literal: true

class Menu
  attr_reader :items

  def initialize(items = {})
    @items = items
    set_items
  end

  def show_menu
    menu = items.map do |item, price|
      "#{item} = #{price}"
    end
    menu.join(', ')
  end

  def show_price(item)
    items[item.to_sym]
  end

  private

  def set_items
    if @items =={}
      @items = { pizza: 10, kebab: 9, curry: 11}
    end

  end
end
