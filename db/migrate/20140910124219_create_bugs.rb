class CreateBugs < ActiveRecord::Migration
  def change
    create_table :bugs do |t|
      t.string :name, null: false, unique: true
      t.string :common_name
      t.string :gram_stain
      t.string :environment
      t.string :morphology
      t.string :growth_pattern
      t.text :description
      t.string :brief_description
      t.text :toxins
      t.integer :order
      t.text :image
      t.belongs_to :bug_class
      t.boolean :motile, default: false
      t.boolean :encapsulated, default: false
      t.boolean :pending
      t.timestamps
    end
  end
end
