FactoryBot.define do
  factory :villa do
    name { "villa_#{Faker::Number.number(digits: 3)}" } # Generates a unique villa name

    after(:create) do |villa|
      start_date = Date.new(2023, 1, 1)
      end_date = Date.new(2023, 5, 1)

      (start_date..end_date).each do |date|
        create(:calendar_entry, villa: villa, date: date)
      end
    end
  end
end