class District < ApplicationRecord
    belongs_to :country, class_name: 'CountryData'
    belongs_to :state

    validates :name, presence: true
end