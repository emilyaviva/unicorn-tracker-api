class Unicorn < ApplicationRecord
  validates_presence_of :name, :color, :food, :location
end
