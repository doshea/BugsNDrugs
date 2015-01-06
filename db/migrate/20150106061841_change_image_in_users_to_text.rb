class ChangeImageInUsersToText < ActiveRecord::Migration
  def change
    change_column :users, :image, :text, default: nil
  end
end
