class CalendarEntry < ApplicationRecord
  belongs_to :villa
  validates :date, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :availability, inclusion: { in: [true, false] }
end