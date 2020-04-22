require 'rails_helper'

RSpec.describe Movie, type: :model do
  before do
    @movie = FactoryBot.build(:movie)
  end

  it "has a valid factory" do
    expect(@movie).to be_valid
  end

  it "is invalid without a name" do
    movie = FactoryBot.build(:movie, movie_name: nil)
    movie.valid?
    expect(movie.errors[:movie_name]).to include("can't be blank")
  end
end
