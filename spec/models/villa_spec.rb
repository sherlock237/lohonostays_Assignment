require 'rails_helper'

RSpec.describe Villa, type: :model do
  let(:villa) { create(:villa) }
  let(:start_date) { Date.new(2023, 1, 1) }
  let(:end_date) { Date.new(2023, 1, 5) }

  describe '#is_available?' do
    context 'when the villa is available' do
      it ' should returns true' do
        expect(villa.is_available?(start_date, end_date)).to be true
      end
    end

    context 'when the villa is not available' do
      before do
        villa.calendar_entries.where(date: start_date).update_all(available: false)
      end

      it 'should returns false' do
        expect(villa.is_available?(start_date, end_date)).to be false
      end
    end
  end

  describe '#average_price' do
    it 'should returns correct average price' do
      expected_average_price = villa.calendar_entries.where(date: start_date...end_date).average(:rate)
    
      expect(villa.average_price(start_date, end_date)).to eq(expected_average_price)
    end
  end

  describe '#total_price' do
    it 'should returns correct total price with GST' do
      sum_price = villa.calendar_entries.where(date: start_date...end_date).sum(:rate)
      expected_total_price = sum_price + sum_price * 0.18
    
      expect(villa.total_price(start_date, end_date)).to eq(expected_total_price)
    end
  end
end
