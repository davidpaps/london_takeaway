class Menu

  attr_reader :items
  
  def initialize(items)
   @items = items
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

end