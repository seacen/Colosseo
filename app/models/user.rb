class User < ActiveRecord::Base
  has_secure_password
  before_create :generate_token
  before_create :init_score

  validates_presence_of :username
  validates :username, uniqueness: true

  private

  def generate_token
  end

  def init_score
    self.score = 0
  end
end
