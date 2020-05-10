require 'order'

describe Order do

  let(:items){{ kebab: 9, pizza: 10, curry: 11 }}
  let(:menu){double :menu, :items => items}
  let(:subject){described_class.new(menu)}

  describe '#select_items' do
    it "selects items avaliable from the menu" do
     subject.select_items("kebab", 1)
     expect(subject.basket.length).to eq(1)
     expect(subject.basket).to eq(kebab: 1)
    end
  end
end