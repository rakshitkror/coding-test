class WelcomeController < ApplicationController
  include SeatAllocatorConcern
  include ObjectInitConcern
  before_action :initialize_objects
  def index
  end

  def get_seats
    if params.has_key?(:id)
      @recommended_seats = find_seats(params[:numseats], params[:id])
    end
    render'index'
  end

  def createmovie
    @movie = Movie.create(movie_params)
    redirect_to welcome_index_path
  end

  private

  def movie_params
    params.require(:movie).permit(:movie_name, :year, :imdb, :rows, :column, :summary, :genre)
  end
end
