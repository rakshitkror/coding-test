module ObjectInitConcern
    def initialize_objects
        @recommended_seats = ''
        @movies = Movie.all
        @movie = Movie.find_by(id: params[:movie_id])
    end
end