class WelcomeController < ApplicationController
  include SeatAllocatorConcern
  before_action :set_attributes
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
