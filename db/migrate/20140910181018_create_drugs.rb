class CreateDrugs < ActiveRecord::Migration
  def change
    create_table :drugs do |t|
      t.string :generic_name, null: false, unique: true
      t.string :chemical_name
      t.string :trade_name

      t.text :mechanism
      t.string :administered
      t.string :metabolized_in
      t.boolean :csf
      
      t.string :toxicities
      
      t.boolean :obscure
      t.boolean :pending
      
      t.belongs_to :drug_class
      t.integer :order
      t.timestamps
    end
  end
end