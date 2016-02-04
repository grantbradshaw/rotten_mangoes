class User < ActiveRecord::Base
  
  has_many :reviews, dependent: :destroy
  before_destroy :send_notification

  has_secure_password

  validates :email, presence: true
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :password, length: { in: 6..20 }, on: :create

  paginates_per 1

  def full_name
    "#{firstname} #{lastname}"
  end

  def send_notification
    UserMailer.delete_email(self).deliver
  end
end
