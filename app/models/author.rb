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
	mount_uploader :photo, PhotoUploader

	has_many :books
end
