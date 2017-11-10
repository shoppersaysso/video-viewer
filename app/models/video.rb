class Video < ApplicationRecord
  has_many :comments

  validates :title, :description, :youtube_video_id, presence: true

end
