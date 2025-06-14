FactoryBot.define do
  factory :neighborhood do
    name  { "Centro" }
     association :city
  end
end
