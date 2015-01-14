class AddTestsToBugs < ActiveRecord::Migration
  def change
    add_column :bugs, :tests, :string
  end
end
