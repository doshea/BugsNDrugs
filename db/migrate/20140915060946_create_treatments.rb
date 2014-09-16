class CreateTreatments < ActiveRecord::Migration
  def change
    create_table :treatments do |t|
      t.belongs_to :drug
      t.belongs_to :treatable
      t.belongs_to :treatable_type
    end
  end
end
