class RenameIconImageColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :icon_image, :image_id
  end
end
