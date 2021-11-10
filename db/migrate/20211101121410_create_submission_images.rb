class CreateSubmissionImages < ActiveRecord::Migration[5.2]
  def change
    create_table :submission_images do |t|
      t.references :submission, foreign_key: true
      t.string :image_id
      t.timestamps
    end
  end
end
