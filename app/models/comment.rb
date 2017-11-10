class Comment < ApplicationRecord
  belongs_to :video

  validates :content, :rating, presence: true
end
