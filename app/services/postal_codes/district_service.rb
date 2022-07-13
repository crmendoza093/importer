class PostalCodes::DistrictService < ::BaseService
    def load!
        table.each do |district_item|
            district = District.where(
                name: district_item['d_tipo_asenta'],
                country_id: country_id,
                state_id: State.find_by(code: district_item['c_estado']).id
            ).first_or_create
        
            district.save!
        end
    end
end