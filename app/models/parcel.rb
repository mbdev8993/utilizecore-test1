class Parcel < ApplicationRecord
  require 'digest/md5'
	after_create :set_tracking_id
  before_save :check_if_sender_and_receiver_exist
	STATUS = ['Sent', 'In Transit', 'Delivered']
	PAYMENT_MODE = ['COD', 'Prepaid']

	validates :weight, :status, presence: true
	validates :status, inclusion: STATUS
	validates :payment_mode, inclusion: PAYMENT_MODE

	belongs_to :service_type
	belongs_to :sender, class_name: 'User', optional: true
	belongs_to :receiver, class_name: 'User', optional: true

	after_create :send_notification
	after_update :send_notification, :if => :status_changed?

	accepts_nested_attributes_for :sender
	accepts_nested_attributes_for :receiver

	# acts_as_xlsx

	def check_if_sender_and_receiver_exist
		#before saving data we can check if sender and receiver already in DB using email and mobile number
		#If it is then we can update the current object to use the existing sendre and reciver
		#if not then we will save the new sender and reciever for the new parcel.
	end

	private

	# Set tracking number with the parcel
  def set_tracking_id
    self.update_column(:tracking_id, Digest::MD5.hexdigest(Time.now.to_s))
  end

	def send_notification
		UserMailer.with(parcel: self).status_email.deliver_later
	end

end
