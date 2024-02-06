class Reservation < ApplicationRecord

    belongs_to :room
    has_many :users

    validates :checkin, presence: true
    validates :checkout, presence: true
    validates :people, presence: true
end
