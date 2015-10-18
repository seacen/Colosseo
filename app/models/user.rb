class User < ActiveRecord::Base
  has_secure_password
  before_create :generate_token
  before_create :init_score

  validates_presence_of :username
  validates :username, uniqueness: true

  private

  def generate_token
    begin
      self.token = SecureRandom.hex
    end while self.class.exists?(token: token)
  end

  def init_score
    self.score = 0
  end
end
