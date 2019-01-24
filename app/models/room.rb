class Room < ApplicationRecord
  has_many :slot
    validates :name, presence: true, length: {maximum: 50},
    uniqueness: {case_sensitive: false}
    validates :capacity, presence: true
end
