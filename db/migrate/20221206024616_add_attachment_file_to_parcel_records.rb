class AddAttachmentFileToParcelRecords < ActiveRecord::Migration[6.1]
  def self.up
    change_table :parcel_records do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :parcel_records, :file
  end
end
