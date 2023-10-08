class Villa < ApplicationRecord
  has_many :calendar_entries

  def is_available?(start_date, end_date)
    (start_date...end_date).all? do |date|
      calendars.where(date: date, availability: true).exists?
    end
  end

  def average_price(start_date, end_date)
    calendars.where(date: start_date...end_date).average(:price)
  end

  def total_price(start_date, end_date)
    calendars.where(date: start_date...end_date).sum(:price)
  end
end