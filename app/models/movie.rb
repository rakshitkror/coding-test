class Movie < ApplicationRecord
	validates :movie_name, :rows, :column, :year, presence: true
end
