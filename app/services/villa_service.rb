class VillaService
  def self.get_villas(start_date, end_date, sort_by)
    start_date = Date.parse(start_date)
    end_date = Date.parse(end_date)

    villas = Villa.all

    available_villas = []
    villas.each do |villa|
      if villa.is_available?(start_date, end_date)
        available_villas << villa
      end
    end

    # Sort villas based on availability and price
    if sort_by == 'price'
      available_villas.sort_by! { |villa| villa.average_price(start_date, end_date) }
    elsif sort_by == 'availability'
      available_villas.sort_by! { |villa| villa.available_days(start_date, end_date) }
    end

    available_villas
  end
end
  