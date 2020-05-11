# frozen_string_literal: true

require 'order'

describe Order do
  let(:items) { { kebab: 9, pizza: 10, curry: 11 } }
  let(:menu) { double :menu, items: items }
  let(:message) { double :message }

  let(:subject) { described_class.new(menu, message) }

  before(:each) do
    allow(menu).to receive(:show_price).with(:kebab).and_return(9)
    allow(menu).to receive(:show_price).with(:pizza).and_return(10)
    allow(menu).to receive(:show_price).with(:curry).and_return(11)
    subject.select_items('kebab')
    subject.select_items('pizza')
    subject.select_items('curry')
  end

  describe '#select_items' do
    it 'selects items avaliable from the menu with 1 quantity as a default' do
      expect(subject.basket.length).to eq(3)
      expect(subject.basket).to eq(kebab: 1, pizza: 1, curry: 1)
    end

    it 'adds the quantity if multiple same items are selected' do
      2. times { subject.select_items('kebab', 1) }
      subject.select_items('pizza', 1)
      expect(subject.basket.length).to eq(3)
      expect(subject.basket).to eq(kebab: 3, pizza: 2, curry: 1)
    end

    it 'throws an error if the item is not avaliable' do
      expect { subject.select_items('chips') }.to raise_error 'No Chips Avaliable!'
    end

    it 'returns a message with the most recent item and quantity, and the total of the basket' do
      expect(subject.select_items('curry')).to eq('2 x Curry Added, Total = £41')
    end
  end

  describe '#calculate_total' do
    it 'calculate the price of the basket' do
      expect(subject.calculate_total).to eq(30)
    end
  end

  describe '#complete_order' do
    it 'sends a tet confirmation' do
      expect(message).to receive(:send)
      subject.complete_order
    end

    it 'finalises the order and returns the contents of the basket' do
      expect(message).to receive(:send)
      expect(subject.complete_order).to eq('Order = 1 x Kebab, 1 x Pizza, 1 x Curry, Total = £30')
    end
  end
end
