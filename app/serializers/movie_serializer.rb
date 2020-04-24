class MovieSerializer < ActiveModel::Serializer
  attributes :id, :genre, :year, :layout, :seats
  # has_many :seats, serializer: SeatSerializer 

  def title
  	object.movie_name
  end

  def layout
  	{venue: {rows: object.rows, columns: object.column}}
  end

  def seats
  	all_seat = Hash.new
  	object.seats.each do |seat|
  		all_seat.store("#{seat.row}#{seat.column}", seat.as_json.except('id', 'seat_combination' , 'movie_id').merge(id: "#{seat.row}#{seat.column}" ))
  	end
  	all_seat
  end
end

