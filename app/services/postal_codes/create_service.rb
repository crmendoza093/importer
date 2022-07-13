class PostalCodes::CreateService < ::BaseService
    def perform!
        return error unless CountryData.any?

        states.load!
        districts.load!
        cities.load!
        municipalities.load!
        addresses.load!

        success
    end

    private

    def states
        PostalCodes::StateService.new
    end

    def districts
        PostalCodes::DistrictService.new
    end

    def cities
        PostalCodes::CityService.new
    end

    def municipalities
        PostalCodes::MunicipalityService.new
    end

    def addresses
        PostalCodes::AddressService.new
    end

    def error
        add_response I18n.t('error.country_not_found'), 400, :error
    end

    def success
        add_response I18n.t('success.finish'), 200, :success
    end
end