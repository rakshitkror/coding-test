class Seat < ApplicationRecord
  belongs_to :movie
  before_save :set_seat_combination

  def set_seat_combination
  	self.seat_combination = "#{row}#{column}"
  end
end
