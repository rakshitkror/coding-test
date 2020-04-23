FactoryBot.define do
  factory :seat do
    row {'a'}
    column {1}
    status {"AVAILABLE"}
    association :movie
  end
end
