class WelcomeController < ApplicationController
  include SeatAllocatorConcern
  before_action :set_attributes
  def index
    movies = Dir["movies/*.json"]
    @movies_data = []
    for i in movies
      file = File.open i
      data = JSON.load file
      @movies_data.push(data)
    end
  end
  
  def intToChar(i, j)
    return (i+97).chr + (j+1).to_s
  end

  def get_seats
    if params.has_key?(:id)
      @recommended_seats = main(params[:numseats], params[:id])
    end
    render'index'
  end

  def createmovie
    @movie = Movie.create(movie_params)
    require 'json'
    final = Hash[
      "seats" => Hash.new
    ]

    for i in 0..(Integer(@movie.rows)-1)
      for j in 0..(Integer(@movie.column)-1)
        seatId = intToChar(i, j)
        final["seats"][seatId] = Hash[
          "id": seatId,
          "row": seatId[0],
          "column": seatId[1],
          "status": "AVAILABLE"
        ]
      end
    end

    File.open("movies/#{@movie.movie_name}.json", "w") do |f|     
      f.write(final.to_json)   
    end
    redirect_to welcome_index_path
  end

  def set_attributes
    @recommended_seats = ''
    @movies = Movie.all
    @movie = Movie.new
  end

  private

  def movie_params
    params.require(:movie).permit(:movie_name, :year, :imdb, :rows, :column, :summary, :genre)
  end
end
