class ParcelRecord < ApplicationRecord
  has_attached_file :file
  validates_attachment :file, presence: true,
                   content_type: { content_type: [
                     "application/vnd.ms-excel",
                     "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
                   ]
                   },
                   message: ' Only EXCEL files are allowed.'
end