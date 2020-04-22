require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

  describe 'GET #index' do
    subject { get :index }

    context 'with logged-in admin' do
      it {expect(subject).to have_http_status(:success)}
      it {expect(subject).to render_template(:index)}
    end

  end

  describe 'GET #available seats' do
    before do
      @movie = FactoryBot.create(:movie)
      final = Hash[
        "seats" => Hash.new
      ]

      for i in 0..(Integer(@movie.rows)-1)
        for j in 0..(Integer(@movie.column)-1)
          seatId =  (i+97).chr + (j+1).to_s
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

    end
    subject { get :get_seats , params: {id: @movie.id, seats: 2}}

    context 'get seats' do
      it {expect(subject).to have_http_status(:success)}
      it {expect(subject).to render_template(:index)}
    end

  end

  describe 'Post #movie' do
    subject { post :createmovie, params: { movie: {movie_name: "Movie name", year: 1998, rows: 6, column: 6, genre: "test genre", summary: "test summary"} }  }
    context 'create movie' do
      it { expect { subject }.to change(Movie, :count).by(1) }
      it { expect(subject).to redirect_to(welcome_index_path) }
    end
  end

end

