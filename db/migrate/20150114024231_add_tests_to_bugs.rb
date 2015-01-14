class AddTestsToBugs < ActiveRecord::Migration
  def change
    ad_column :bugs, :tests, :string
  end
end
