json.extract! parcel_record, :id, :file, :created_at, :updated_at
json.url parcel_record_url(parcel_record, format: :json)
