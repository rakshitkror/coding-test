module SeatAllocatorConcern

    def isInArray(value, array)
        return array.has_key? value
    end

    def intToSeatId(i, j)
        character = (97 + i).chr;
        return "#{character}#{j+1}";
    end

    def is_available(i, j, no_of_seats)
        no_of_seats.times do |foo|
            colIndex = foo + j;
            if (!isInArray(intToSeatId(i, colIndex), @data['seats']))
                return false;
            end
            if (@data['seats'][intToSeatId(i, colIndex)]['status'] != 'AVAILABLE') 
                return false;
            end
        end
        return true;
    end

    def closest_to_the_middle(availables)
         currentFavorite = [];
         currentLowestDistance = @cols+1;

            availables.length.times do |i|
            current = availables[i];
            distFromMiddle = (@cols/2 - current[1]).abs();
            
            if (distFromMiddle < currentLowestDistance) 
                currentFavorite = current;
                currentLowestDistance = distFromMiddle;
            end
        end

        return currentFavorite;
    end

    def find_best_available_seat(no_of_seats)
        @rows.times do |i|
             availables = [];
            @rows.times do |j|
                if (is_available(i, j, no_of_seats)) 
                    availables.push([i, j]);
                end
            end

            if (availables.length > 0) 
                return closest_to_the_middle(availables);
            end
        end
    end

    def get_final_result(best_available_seat, no_of_seats)
         string = "";
        no_of_seats.times do |i|
            if (no_of_seats >= @cols/2+0.51) 
                string = string + "#{intToSeatId(best_available_seat[0], best_available_seat[1]+i)} "
            
            else
            
                string = string + "#{intToSeatId(best_available_seat[0], best_available_seat[1]-i)} "
            end
        end

        return (string);
    end

    def main(no_of_seats = 1, id)
        no_of_seats = no_of_seats.to_i
        @movie_for_seats = Movie.find_by(id: id)
        if (@movie_for_seats.movie_name == '') 
            return ('Error: Please provide movie title');
            return 1; 
        end
        @data = JSON.parse(File.read("movies/#{@movie_for_seats.movie_name}.json"));

        @rows = @movie_for_seats.rows;
        @cols = @movie_for_seats.column;
        if (no_of_seats > @cols)
            return ('Error: Number of seats requested exceeds number of seats available in a row');
            return 1;
        end

        best_available_seat = find_best_available_seat(no_of_seats);
        if !(best_available_seat) 
            return ('Error: Could not find seat. This may be because no appropriate seats are available');
            return 1;
        end

        a = get_final_result(best_available_seat, no_of_seats).split(' ');
        return a;
    end
end