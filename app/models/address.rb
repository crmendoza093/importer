class Address < ApplicationRecord
    belongs_to :country, class_name: 'CountryData'
    belongs_to :state
    belongs_to :city, optional: true
    belongs_to :municipality

    validates :neighborhood, :postal_code, presence: true
end