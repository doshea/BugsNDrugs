class CreateDrugClasses < ActiveRecord::Migration
  def change
    create_table :drug_classes do |t|
      t.string :name
      t.integer :tier
      t.text :description
      t.integer :order

      t.belongs_to :drug_class
      t.timestamps
    end
  end
end