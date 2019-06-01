# frozen_string_literal: true

# Evelator door
class Door
  attr_accessor :material, :condition
  def initialize(material)
    @material = material
    @condition = 'closed'
  end
end
