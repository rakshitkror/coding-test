module ObjectInitConcern
    def initialize_objects
        @recommended_seats = ''
        @movies = Movie.all
        @movie = Movie.new
    end
end