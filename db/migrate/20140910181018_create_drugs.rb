class CreateDrugs < ActiveRecord::Migration
  def change
    create_table :drugs do |t|
      t.boolean :pending
      t.timestamps
    end
  end
end
