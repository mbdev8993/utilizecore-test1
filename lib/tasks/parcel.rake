namespace :parcel do
  desc 'Generate xlsx file containg parcel, sender, receiver data'
  task :generate_csv => [ :environment ] do
    p "Generating..."
    @parcels = Parcel.includes(:users).references(:users)
    require 'axlsx'
    require 'zip/zip'

      p = Axlsx::Package.new
      p.workbook.add_worksheet("Parcel Data".to_sym) do |wb|
        wb.add_worksheet("parcel_data_#{Time.now}") do  |ws|
          ws.add_row ["Parcel Data on #{Time.now}"]
          ws.add_row ['Weight', 'Status', 'Service Type', 'Payment Mode', "Cost", "Sender Name", "Sender Email", " Sender Mobile Number", "Receiver Name", "Receiver Email", "Receiver Mobile Number", "Tracking Numner"]
          @parcels.each do |parcel|
            ws.add_row ["#{parcel.weight}", "#{parcel.status}", "#{parcel.service_type}", "#{parcel.payment_mode}", "#{parcel.cost}", "#{parcel.sender.name}", "#{parcel.sender.email}", "#{parcel.sender.mobile}", "#{parcel.receiver.name}", "#{parcel.receiver.email}", "#{parcel.receiver.mobile}", "#{parcel.tracking_id}"]
          end

          # ws.merge_cells 'A1:L1'
        end
      end
    p.serialize "parcel_data.xlsx"
    # ParcelRecord.create(file: p, file_file_name: "parcel_data_#{Time.now}.xlsx")
    ParcelRecord.create(file: File.open("./public/system/parcel_records/files/000/000/001/original/parcel_data.xlsx", "r"), file_file_name: "acs_job.xlsx")
     # have modify this command so that it can upload csv into database and we can download this from UI

    # ParcelRecord(id: integer, file: string, created_at: datetime, updated_at: datetime, file_file_name: string, file_content_type: string, file_file_size: integer, file_updated_at: datetime)
  end
end