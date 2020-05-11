require 'takeaway'

describe Takeaway do
  
 
  menu = Menu.new
  order = Order.new
  message = Message.new
  subject = described_class.new(order)

  describe "#view_menu" do
    it 'allows a user to view the menu, default if one is not provided' do
      expect(subject.view_menu).to eq("pizza = £10, kebab = £9, curry = £11")
    end
   
    
  end

end