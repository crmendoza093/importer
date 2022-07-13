class Municipality < ApplicationRecord
    belongs_to :country, class_name: 'CountryData'
    belongs_to :state
    belongs_to :city, optional: true

    validates :name, presence: true
end