class User < ApplicationRecord
has_many :meeting
  before_save { self.email = email.downcase }
  before_save :generate_token
  validates :name,  presence: true, length: { maximum: 50 }
  APPROVED_DOMAINS = ["commutatus.com", "sarthakjha.com"]

   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
   validates :email, presence: true, if: :domain_check, length: { maximum: 255 },
                     format: { with: VALID_EMAIL_REGEX },
                     uniqueness: { case_sensitive: false }
                      has_secure_password
                      validates :password, presence: true, length: { minimum: 6 }

                      # Returns the hash digest of the given string.
                        def User.digest(string)
                          cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                                        BCrypt::Engine.cost
                          BCrypt::Password.create(string, cost: cost)
                        end

                        def domain_check
                          unless APPROVED_DOMAINS.any? { |word| email.end_with?(word)}
                            errors.add(:email, "is not from a valid domain")
                          end
                        end

                        def generate_token
                         self.token = loop do
                           token = SecureRandom.urlsafe_base64(nil, false)
                           break token unless self.class.exists?(token: token)
                         end
                       end
end
