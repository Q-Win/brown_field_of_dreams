class User < ApplicationRecord

  has_many :friendships
  has_many :friends, through: :friendships

  has_one :github_data
  has_many :user_videos
  has_many :videos, through: :user_videos

  validates :email, uniqueness: true, presence: true
  validates_presence_of :password
  validates_presence_of :first_name
  enum role: [:default, :admin]
  has_secure_password

  def sort_videos
    videos.joins(:tutorial).order('tutorial_id ASC, videos.id')
  end

  def authenticated?(token)
    return false if activation_digest.nil?
    BCrypt::Password.new(activation_digest).is_password?(token)
  end

  def activation_token
    SecureRandom.base64
  end

  def friend_of(user_id)
    friendships.find_by(friend_id: user_id)
  end
end
