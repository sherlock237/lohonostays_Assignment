namespace :db do
  desc "Seed the database with 50 villas"
  task seed_villas: :environment do
    start_date = Date.new(2023,1,1)
    end_date = Date.new(2023,12,31)

    50.times do |i|
      villa = Villa.create!(name: "villa_#{i + 1}")

      (start_date..end_date).each do |date|
        CalendarEntry.create!(
          villa: villa,
          date: date,
          rate: rand(30_000..50_000),
          available: [true, false].sample
        )
      end
    end
  end
end