require 'order'

describe Order do

  let(:items){{ kebab: 9, pizza: 10, curry: 11 }}
  let(:menu){double :menu, :items => items}
  let(:subject){described_class.new(menu)}

  describe '#select_items' do
    it "selects items avaliable from the menu" do
     3. times {subject.select_items("kebab", 1)}
     2.times {subject.select_items("pizza", 1)}
     subject.select_items("curry", 1)
 
     expect(subject.basket.length).to eq(3)
     expect(subject.basket).to eq(kebab: 3, pizza: 2, curry: 1)
    end
  end
end