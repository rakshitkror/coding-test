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
  	seat1 = Hash.new
  	object.seats.each do |seat2|
  		seat1.store("#{seat2.row}#{seat2.column}", seat2.as_json.except('id', 'created_at', 'updated_at' , 'movie_id').merge(id: "#{seat2.row}#{seat2.column}" ))
  	end
  	seat1
  end
end

