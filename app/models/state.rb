class State < ApplicationRecord
    belongs_to :country, class_name: 'CountryData'
    has_many :districts
    has_many :cities
    has_many :municipalities

    validates :code, :name, presence: true
    validates_length_of :code, minimum: 2
end