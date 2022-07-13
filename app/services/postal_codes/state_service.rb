class PostalCodes::StateService < ::BaseService
    def load!
        table.each do |state_item|
            state = State.where(
                code: state_item['c_estado'],
                name: state_item['d_estado'],
                country_id: country_id
            ).first_or_create
        
            state.save!
        end
    end
end