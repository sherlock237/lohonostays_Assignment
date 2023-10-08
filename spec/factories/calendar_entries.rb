FactoryBot.define do
  factory :calendar_entry do
    villa
    date { Date.today }
    rate { Faker::Number.between(from: 30_000, to: 50_000) }
    available { true }
  end
end