class Menu

  def initialize(items)
   @items = items
  end

  def show_menu
    menu = @items.map do |item, price|
       "#{item} = #{price}"
    end
       menu.join(', ')
  end
end