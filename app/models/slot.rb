class Slot < ApplicationRecord
  belongs_to :room
  before_save :generate_token
  validates :start, presence: true, if: :valid_start
  validates :stop, presence: true, if: :valid_stop
  validates :people, presence: true, if: :valid_people

  def valid_start
  (start.to_time.hour>=9 && stop.to_time- start.to_time >= 1800) ? true : errors.add(:start)
  end
  def valid_stop
    stop.to_time.hour<=20 ? true : errors.add(:stop)
  end
  def valid_people
people<=room.capacity ? true : errors.add(:people)
  end

  def generate_token
   self.token = loop do
     token = SecureRandom.urlsafe_base64(nil, false)
     break token unless self.class.exists?(token: token)
   end
 end
end
