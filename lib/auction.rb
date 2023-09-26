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
end