require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.describe Item do
  before(:each) do
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
  end

  describe '#initialize' do
    it 'has a name' do
      expect(@item1.name).to eq("Chalkware Piggy Bank")
    end
  end
end