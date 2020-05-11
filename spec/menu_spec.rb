# frozen_string_literal: true

require 'menu'

describe Menu do
  let(:items) { { kebab: 9, pizza: 10, curry: 11 } }
  let(:subject) { described_class.new(items) }

  describe '#show_menu' do
    it 'shows the items on the menu' do
      expect(subject.show_menu).to eq('kebab = £9, pizza = £10, curry = £11')
    end
  end

  describe '#show_price' do
    it 'shows the price of an item on the menu' do
      expect(subject.show_price('pizza')).to eq(10)
    end
  end
end
