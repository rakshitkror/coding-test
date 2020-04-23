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

