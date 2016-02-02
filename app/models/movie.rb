class Movie < ActiveRecord::Base

  has_many :reviews
  mount_uploader :poster, PosterUploader
  
  validates :title, presence: true
  validates :director, presence: true
  validates :runtime_in_minutes, numericality: { only_integer: true}
  validates :description, presence: true
  validates :release_date, presence: true
  validate :release_date_is_in_past

  def release_date_is_in_past
    if release_date.present?
      errors.add(:release_date, "should be in the past") if release_date > Date.today
    end
  end

  def review_average
    (reviews.sum(:rating_out_of_ten).to_f/reviews.size).round(2) if reviews.size > 0
  end

end
