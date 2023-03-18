class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true, length: { minimum: 250 }
  validates :summary, presence: true, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbait



  def clickbait
    if title.present? && !title.match(/(Won't Believe|Secret|Top \d|Guess)/)
      errors.add(:title, "must be clickbait-y")
    end
  end

end
