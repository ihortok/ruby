# frozen_string_literal: true

# the class for passengers in elevator
class Passenger
  attr_accessor :from
  attr_accessor :to
  attr_accessor :weight

  def initialize(from, to, weight)
    @from = from
    @to = to
    @weight = weight
  end
end
