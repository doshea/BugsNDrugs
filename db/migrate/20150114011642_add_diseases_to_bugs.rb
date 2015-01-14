class AddDiseasesToBugs < ActiveRecord::Migration
  def change
    add_column :bugs, :diseases, :text, array: true, default: []
  end
end