class CreateBugClasses < ActiveRecord::Migration
  def change
    create_table :bug_classes do |t|
      t.string :name, null: false, unique: true
      t.integer :order
      t.belongs_to :superclass
      t.timestamps
    end
  end
end
