class Movie < ApplicationRecord
	validates :movie_name, :year, presence: true
	after_create :create_seats
	has_many :seats, dependent: :destroy
	belongs_to :venue

	def create_seats
		venue.rows.times do |row|
			venue.columns.times do |col|
				Seat.create(row: (97 + row).chr, column: (col+1), status: "AVAILABLE", movie_id: self.id)
			end
		end
	end
end
