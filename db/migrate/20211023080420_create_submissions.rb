class CreateSubmissions < ActiveRecord::Migration[5.2]
  def change
    create_table :submissions do |t|
      t.string :submission_title
      t.integer :user_id
      t.string :submission_thumbnail
      t.string :submission_image
      t.string :submission_comment
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
