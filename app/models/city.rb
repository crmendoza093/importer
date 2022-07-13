class City < ApplicationRecord
    belongs_to :country, class_name: 'CountryData'
    belongs_to :state
    has_many :municipalities

    validates :name, presence: true
end