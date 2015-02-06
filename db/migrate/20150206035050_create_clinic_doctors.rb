class CreateClinicDoctors < ActiveRecord::Migration
  def change
    create_table :clinic_doctors do |t|
      t.integer :clinic_id
      t.integer :doctor_id

      t.timestamps null: false
    end
  end
end
