class AddPatientDemographicsToBugs < ActiveRecord::Migration
  def change
    add_column :bugs, :patient_demographics, :string
  end
end
