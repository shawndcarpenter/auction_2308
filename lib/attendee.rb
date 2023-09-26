require './lib/item'
require './lib/auction'

class Attendee
  attr_reader :name, :budget, :items

  def initialize(data)
    @name = data[:name]
    @budget = data[:budget].delete('$').to_i
  end
end