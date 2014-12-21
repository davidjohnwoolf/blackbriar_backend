class CreateTrainingVideos < ActiveRecord::Migration
  def change
    create_table :training_videos do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.string :video, null: false
      
      t.timestamps
    end
  end
end
