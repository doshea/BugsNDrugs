class AddTransmissionToBugs < ActiveRecord::Migration
  def change
    add_column :bugs, :transmission, :string
  end
end
