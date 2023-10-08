class CalendarEntry < ApplicationRecord
  belongs_to :villa
  validates :date, presence: true
  validates :rate, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :available, inclusion: { in: [true, false] }
end