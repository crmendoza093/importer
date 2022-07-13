class PostalCodes::MunicipalityService < ::BaseService
    def load!
        table.each do |municipality_item|
            municipality = Municipality.where(
                name: municipality_item['D_mnpio'],
                country_id: country_id,
                state_id: State.find_by(code: municipality_item['c_estado']).id,
                city_id: city(municipality_item['d_ciudad'])
            ).first_or_create
        
            municipality.save!
        end
    end
end