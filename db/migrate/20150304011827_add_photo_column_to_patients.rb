class AddPhotoColumnToPatients < ActiveRecord::Migration
  def change
  	add_column :doctors, :photo, :string
  end
end
