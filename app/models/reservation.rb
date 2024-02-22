class Reservation < ApplicationRecord

    belongs_to :room
    belongs_to :user

    validates :checkin, presence: true
    validates :checkout, presence: true
    validates :people, presence: true
end
