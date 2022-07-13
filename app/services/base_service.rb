require 'csv'

class BaseService

    def initialize
        @table = CSV.parse(File.read("lib/tasks/data/postal_codes.csv"), headers: true)
        @country_id ||= country
        @response = nil
    end

    def add_response message, code, status
        @response = [
            {
                status: status,
                code: code,
                message: message 
            }
        ]
    end

    attr_accessor :response

    private

    attr_accessor :table, :country_id

    def country
        CountryData.first.id if CountryData.any?
    end

    def city name
        return if name.blank?

        City.find_by(name: name).id
    end
end