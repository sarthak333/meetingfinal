class Slot < ApplicationRecord
  has_many :srecord
  belongs_to :room
  before_save :generate_token
  validates :name, presence: true
  validates :start, presence: true
  validate :valid_start
  validates :stop, presence: true
  validate :valid_stop
  validates :description, presence: true

  def valid_start

    if start.present? && stop.present?
      if start.to_time.hour < 9
        errors.add(:start,"Not within Office Timings")
       end
      slot=room.slot.all
      slot.each do |s|
        if start.between?(s.start, s.stop-1) || stop.between?(s.start, s.stop-1)
          errors.add(:start,"Overlapping")
        end
      end
         end
      # queryslot= Slot.all
      # queryslot.each do |q|
      #   puts start
      #   puts "testbug"
      #   if start.between?(q.start, q.stop-1) || stop.between?(q.start, q.stop-1)
      #     errors.add(:start)
      #   end
      # end

  end
  def valid_stop
  if stop.to_time.hour>20
    errors.add(:stop, "Not within Office Timings")
end
if(stop.to_time-start.to_time<=1800)
  errors.add(:stop, "Minimum duration is 30 mins")
  end
end

  def generate_token
   self.token = loop do
     token = SecureRandom.urlsafe_base64(nil, false)
     break token unless self.class.exists?(token: token)
   end
 end
end
