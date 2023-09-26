require './lib/attendee'
require './lib/auction'

class Item < Attendee
  attr_reader :name, :bids

  def initialize(name)
    @name = name
    @bids = {}
  end

  def add_bid(attendee, amount)
    @bids[attendee] = amount
  end

  def current_high_bid
    if @bids.empty?
      0
    else
      @bids.max_by { |k,v| v }.last
    end
  end
end