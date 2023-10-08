require 'rails_helper'

RSpec.describe VillasController, type: :controller do
  let(:villa) { create(:villa) }
  let(:start_date) { Date.new(2023, 1, 1) }
  let(:end_date) { Date.new(2023, 1, 5) }

  describe 'GET #index' do
    context 'when sorting by price' do
      before do
        get :index, { start_date: start_date.to_s, end_date: end_date.to_s, sort_by: "price"}
      end

      it 'returns a success response' do
        expect(response.status).to eq(200)
      end

      it 'assigns @villas_details  sorted by price' do
        expect(JSON.parse(response.body)).not_to be_nil
        villas_details = JSON.parse(response.body)
        sorted_by_price = villas_details.sort_by! { |villa| villa["average_price"] }
        expect(villas_details).to eq(sorted_by_price)
      end
    end

    context 'when sorting by availability' do
      before do
        get :index, { start_date: start_date.to_s, end_date: end_date.to_s, sort_by: "availability"}
      end

      it 'returns a success response' do
        expect(response.status).to eq(200)
      end

      it 'assigns @villas_details  sorted by availability' do
        expect(JSON.parse(response.body)).not_to be_nil
        villas_details = JSON.parse(response.body)
        sorted_by_availability = villas_details.sort_by! { |villa| villa["availability"] ? 0 : 1 }
        expect(villas_details).to eq(sorted_by_availability)
      end
    end
  end

  describe 'GET #show' do
    before do
      get :show, { id: villa.id, start_date: start_date.to_s, end_date: end_date.to_s }
    end

    it 'returns a success response' do
      expect(response.status).to eq(200)
    end

    it 'assigns @villa_info' do
      expect(JSON.parse(response.body)).not_to be_nil
    end
  end
end
