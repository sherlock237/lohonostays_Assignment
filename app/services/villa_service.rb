class VillaService
  def self.get_villas(start_date, end_date, sort_by)
    villas = Villa.includes(:calendar_entries).all
    villa_data = map_villa_data(start_date, end_date, villas)

    if sort_by == 'price'
      villa_data.sort_by! { |villa| villa[:average_price] }
    elsif sort_by == 'availability'
      villa_data.sort_by! { |villa| villa[:availability] ? 0 : 1 }
    end

    villa_data
  end

  def self.get_villa_info(villa, start_date, end_date)
    availability = villa.is_available?(start_date, end_date)
    total_price = villa.total_price(start_date, end_date)

    {
      id: villa.id,
      name: villa.name,
      total_price: total_price,
      availability: availability,
    }
  end

  def self.map_villa_data(start_date, end_date, villas)
    villa_data = villas.map do |villa|
      availability = villa.is_available?(start_date, end_date)
      average_price = villa.average_price(start_date, end_date)

      {
        id: villa.id,
        name: villa.name,
        average_price: average_price,
        availability: availability,
      }
    end
  end

end
