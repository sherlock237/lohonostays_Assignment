class Villa < ApplicationRecord
  has_many :calendar_entries

  def is_available?(start_date, end_date)
    (start_date...end_date).all? do |date|
      calendar_entries.where(date: date, available: true).exists?
    end
  end

  def average_price(start_date, end_date)
    calendar_entries.where(date: start_date...end_date).average(:rate)
  end

  def total_price(start_date, end_date)
    sum_price = calendar_entries.where(date: start_date...end_date).sum(:rate)
    sum_price + sum_price * 0.18  # Adding 18% GST
  end
end