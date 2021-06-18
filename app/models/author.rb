# == Schema Information
#
# Table name: authors
#
#  id          :bigint           not null, primary key
#  full_name   :string
#  description :string
#  photo       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Author < ApplicationRecord
	include ViewsDecorator

	mount_uploader :photo, PhotoUploader

	has_many :books

	def short_description
		super self.full_name
	end

	def get_image
		super self.photo_url
	end
end
