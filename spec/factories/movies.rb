FactoryBot.define do
  factory :movie do
    movie_name { Faker::Name.first_name  }
    imdb { Faker::Internet.email }
    year { 1999 }
    rows { rand (20)}
    column { rand(20)}
    summary {"test desription"}
    genre {"Test Genre"}
  end
end
