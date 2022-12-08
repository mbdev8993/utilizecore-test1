class CreateParcelRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :parcel_records do |t|
      t.string :file

      t.timestamps
    end
  end
end
