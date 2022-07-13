class PostalCodes::CityService < ::BaseService
    def load!
        table.each do |city_item|
            next if city_item['d_ciudad'].blank?

            city = City.where(
                name: city_item['d_ciudad'],
                country_id: country_id,
                state_id: State.find_by(code: city_item['c_estado']).id
            ).first_or_create
        
            city.save!
        end
    end
end