class AddDescriptionToBugClasses < ActiveRecord::Migration
  def change
    add_column :bug_classes, :description, :text
  end
end
