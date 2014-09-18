class CreateSideEffects < ActiveRecord::Migration
  def change
    create_table :side_effects, id: false do |t|
      t.belongs_to :drug
      t.belongs_to :effectable, polymorphic: true
    end
  end
end
