class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
	validates :name, presence: true
  validates_uniqueness_of :email
	has_one :address
	has_many :send_parcels, foreign_key: :sender_id, class_name: 'Parcel'
	has_many :received_parcels, foreign_key: :receiver_id, class_name: 'Parcel'

	accepts_nested_attributes_for :address


	def name_with_address
		@name_with_address ||= [name, address.andand.address_line_one, address.city, address.state, address.country, address.pincode].join('-')
	end
end
