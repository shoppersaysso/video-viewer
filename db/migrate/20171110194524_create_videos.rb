class CreateVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.string :youtube_video_id

      t.timestamps
    end
  end
end
