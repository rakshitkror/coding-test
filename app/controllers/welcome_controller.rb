class WelcomeController < ApplicationController
  include SeatAllocatorConcern
  include ObjectInitConcern
  before_action :initialize_objects
  def index
  end

  def get_seats
    @movie = Movie.find_by(id: params[:form][:movie_id])
    @recommended_seats = find_seats(params[:form][:numseats], @movie.id)
    render'index'
  end

  def book_seats
    @seats = JSON.parse(params[:seats])
    Seat.where(movie_id: @movie.id, seat_combination: @seats).update_all(status: "BOOKED")
  end

  private

  def movie_params
    params.require(:movie).permit(:movie_name, :year, :imdb, :rows, :column, :summary, :genre)
  end
end
