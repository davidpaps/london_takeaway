# frozen_string_literal: true

require 'takeaway'

describe Takeaway do
  menu = Menu.new
  message = Message.new
  order = Order.new(menu, message)
  subject = described_class.new(order)

  describe '#view_menu' do
    it 'allows a user to view the menu, default if one is not provided' do
      expect(subject.view_menu).to eq('pizza = £10, kebab = £9, curry = £11')
    end
  end

  describe '#order_item' do
    it 'allows a user to order items on the menu' do
      subject.order_item('curry', 2)
      subject.order_item('kebab', 1)
      expect(subject.order.basket.length).to eq(2)
      expect(subject.order_item('pizza')).to eq('1 x Pizza Added, Total = £41')
    end
  end

  describe '#finalise_order' do
    it 'sends text with order details' do
      expect(message).to receive(:send)
      subject.finalise_order
    end

    it 'see a final confirmation of order when actioned' do
      expect(message).to receive(:send)
      expect(subject.finalise_order).to eq('Order = 2 x Curry, 1 x Kebab, 1 x Pizza, Total = £41')
    end
  end
end
