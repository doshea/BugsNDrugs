class CreateDrugs < ActiveRecord::Migration
  def change
    create_table :drugs do |t|
      t.string :generic_name, null: false, unique: true
      t.string :chemical_name
      t.string :trade_name
      t.boolean :csf
      t.string :administered
      t.string :toxicities
      t.string :metabolized_in
      t.text :mechanism
      t.boolean :pending
      t.integer :order
      
      t.belongs_to :drug_class
      t.timestamps
    end
  end
end