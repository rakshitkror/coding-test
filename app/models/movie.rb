class Movie < ApplicationRecord
	validates :movie_name, :rows, :column, :year, presence: true
	after_create :create_seats
	has_many :seats

	def create_seats
		rows.times do |row|
			column.times do |col|
				Seat.create(row: (97 + row).chr, column: (col+1), status: "AVAILABLE", movie_id: self.id)
			end
		end
	end
end
