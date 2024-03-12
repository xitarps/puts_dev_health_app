class CreateHealthProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :health_profiles do |t|
      t.decimal :systolic_arterial_pressure
      t.decimal :diastolic_arterial_pressure
      t.decimal :mean_arterial_pressure

      t.timestamps
    end
  end
end
