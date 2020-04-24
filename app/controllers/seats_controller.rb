class SeatsController < ApplicationController
  before_action :set_movie, only: [:index, :update]

  # GET /movies
  # GET /movies.json
  def index
    
    @seats = Seat.where(movie: @movie)
  end

  def update
    seat = Seat.find(params[:id])
    respond_to do |format|
      if seat.update(status: params[:status])
        format.html { redirect_to movie_seats_path(@movie), notice: 'Seat was successfully updated.' }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      
      @movie = Movie.find(params[:movie_id])
    end

end
