class CountryData < ApplicationRecord
    has_many :states
    has_many :districts
    has_many :cities
    has_many :municipalities

    validates :country_code, presence: true
    validates_length_of :country_code, minimum: 2
end
