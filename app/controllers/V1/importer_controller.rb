module V1
    class ImporterController < ApplicationController
        def load
            @service = PostalCodes::CreateService.new

            @service.perform!

            render json: @service.response, status: @service.response.first[:code]
        end

        def list
            postal_codes = Address.where(postal_code: params[:postal_code])

            render json: postal_codes, status: 200
        end
    end
end