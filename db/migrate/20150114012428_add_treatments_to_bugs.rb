class AddTreatmentsToBugs < ActiveRecord::Migration
  def change
    add_column :bugs, :treatments, :text, array: true, default: []
  end
end
