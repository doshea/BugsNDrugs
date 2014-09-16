class CreateSideEffects < ActiveRecord::Migration
  def change
    create_table :side_effects do |t|
      t.belongs_to :drug
      t.belongs_to :side_effect
      t.string :side_effect_type
    end
  end
end
