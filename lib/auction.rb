require './lib/item'
require './lib/attendee'

class Auction
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    @items.map do |item|
      item.name
    end
  end

  def unpopular_items
    unpopular = @items.find_all do |item|
      item.bids.empty?
    end
  end

  def potential_revenue
    total = 0
    @items.each do |item|
      total += item.current_high_bid
    end
    total
  end

  def bidders
    bidders = []
    @items.each do |item|
      item.bids.each do |attendee, amount|
        bidders << attendee.name
      end
    end
    bidders.uniq
  end


  def bidder_info
    bidders = {}
    @items.each do |item, attendee|
      item.bids.each do |attendee, amount|
        if !bidders.include?(attendee)
          bidders[attendee] = [item]
        else
          bidders[attendee] << item
        end
      end
    end
    bidders_with_info = {}
    bidders.each do |bidder, items|
      bidders_with_info[bidder] = {budget: bidder.budget, items: items}
    end
    bidders_with_info
  end
end