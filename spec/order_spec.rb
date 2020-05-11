# frozen_string_literal: true

require 'order'

describe Order do
  let(:items) { { kebab: 9, pizza: 10, curry: 11 } }
  let(:menu) { double :menu, items: items }
  let(:subject) { described_class.new(menu) }

  before(:each) do
    allow(menu).to receive(:show_price).with(:kebab).and_return(9)
    allow(menu).to receive(:show_price).with(:pizza).and_return(10)
    allow(menu).to receive(:show_price).with(:curry).and_return(11)
  end

  describe '#select_items' do
    it 'selects items avaliable from the menu with 1 quantity as a default' do
      subject.select_items('kebab')
      subject.select_items('pizza')
      subject.select_items('curry')
      expect(subject.basket.length).to eq(3)
      expect(subject.basket).to eq(kebab: 1, pizza: 1, curry: 1)
    end

    it 'adds the quantity if multiple same items are selected' do
      3. times { subject.select_items('kebab', 1) }
      2.times { subject.select_items('pizza', 1) }
      subject.select_items('curry', 1)
      expect(subject.basket.length).to eq(3)
      expect(subject.basket).to eq(kebab: 3, pizza: 2, curry: 1)
    end

    it 'throws an error if the item is not avaliable' do
      expect { subject.select_items('chips') }.to raise_error 'No Chips Avaliable!'
    end

    it 'returns a message with the most recent item and quantity, and the total of the basket' do
      subject.select_items('kebab')
      subject.select_items('pizza')
      subject.select_items('kebab')
      expect(subject.select_items('curry')).to eq('1 x Curry Added, Total = £39')
    end
  end

  describe 'calculate total' do
    it 'calculate the price of the basket' do
      subject.select_items('kebab')
      subject.select_items('pizza')
      expect(subject.calculate_total).to eq(19)
    end
  end
end
