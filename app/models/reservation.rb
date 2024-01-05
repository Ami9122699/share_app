class Reservation < ApplicationRecord

    belongs_to :room

    validates :checkin, presence: true
    validates :checkout, presence: true
    validates :people, presence: true
end
