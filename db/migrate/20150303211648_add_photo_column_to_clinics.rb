class AddPhotoColumnToClinics < ActiveRecord::Migration
  def change
  	add_column :clinics, :photo, :string
  end
end
