require 'rails_helper'

RSpec.describe Movie, type: :model do
  before do
    @movie = FactoryBot.build(:movie)
  end

  it "has a valid factory" do
    expect(@movie).to be_valid
  end
end
