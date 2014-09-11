class CreateBugClasses < ActiveRecord::Migration
  def change
    create_table :bug_classes do |t|
      t.string :name, null: false
      t.integer :tier
      t.integer :order
      t.text :image
      t.belongs_to :bug_class
      t.boolean :pending
      t.timestamps
    end
  end
end