class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: ["Fiction", "Non-Fiction"] 
    validate :is_clickbait?
    Clickbait_Patterns =
    [/Won't Believe/,
    /Secret/,
    /Top [0-9]/,
    /Guess/]

  def is_clickbait?
    if Clickbait_Patterns.none? {|p| p.match title }
      errors.add(:title, "Needs to be more clickbaity!")
    end
  end
end
