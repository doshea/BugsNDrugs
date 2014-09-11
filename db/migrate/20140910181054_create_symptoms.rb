class CreateSymptoms < ActiveRecord::Migration
  def change
    create_table :symptoms do |t|
      t.string :name, null: false, unique: true
      t.text :image
      t.boolean :pending
      t.timestamps
    end
  end
end