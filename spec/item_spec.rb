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

  describe '#add_bid' do
    it 'can bid on item' do
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      expect(@item1.bids).to eq({@attendee2 => 20, @attendee1 => 22})
    end
  end
  
  describe '#current_high_bid' do
    it 'can find highest bid' do
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      expect(@item1.current_high_bid).to eq(22)
    end
  end

  it 'can close bidding' do
    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)
    expect(@item1.bids).to eq({@attendee2 => 20, @attendee1 => 22})
    @item1.close_bidding
    @item1.add_bid(@attendee3, 30)
    expect(@item1.bids).to eq({@attendee2 => 20, @attendee1 => 22})
  end
end