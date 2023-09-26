require './lib/attendee'
require './lib/auction'

class Item
  attr_reader :name, :bids, :bidding_closed

  def initialize(name)
    @name = name
    @bids = {}
    @bidding_closed = false
  end

  def add_bid(attendee, amount)
    if @bidding_closed == false
      @bids[attendee] = amount
    end
  end

  def current_high_bid
    if @bids.empty?
      0
    else
      @bids.max_by { |k,v| v }.last
    end
  end

  def close_bidding
    @bidding_closed = true
  end
end