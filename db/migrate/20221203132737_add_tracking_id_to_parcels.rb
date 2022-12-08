class AddTrackingIdToParcels < ActiveRecord::Migration[6.1]
  def change
    add_column :parcels, :tracking_id, :string
    add_index :parcels, :tracking_id, unique: true
  end
end
