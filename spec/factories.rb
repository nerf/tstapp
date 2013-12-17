FactoryGirl.define do
  factory :company do
    name 'dummy'
    address 'over there'
    city 'London'
    country 'United Kingdom'
    sequence(:email) { |i| "company#{i}@example.com" }
    sequence(:phone) { |i| "+44 555-55#{i}" }
  end
end
