class PostalCodes::AddressService < ::BaseService
    def load!
        table.each do |address_item|
            address = Address.where(
                neighborhood: address_item['d_asenta'],
                postal_code: address_item['d_codigo'],
                country_id: country_id,
                state_id: State.find_by(code: address_item['c_estado']).id,
                city_id: city(address_item['d_ciudad']),
                municipality_id: Municipality.find_by(name: address_item['D_mnpio']).id
            ).first_or_create
        
            address.save!
        end
    end
end