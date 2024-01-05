class Room < ApplicationRecord
    has_many :reservations


    validates :name, presence: true
    validates :introduction, presence: true
    validates :price, presence: true, numericality: true
    validates :address, presence: true

end
