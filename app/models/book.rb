# == Schema Information
#
# Table name: books
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :string
#  isbn        :string
#  price       :float
#  stock       :integer
#  book_score  :float
#  score       :float
#  photo       :string
#  author_id   :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Book < ApplicationRecord
  belongs_to :author

   mount_uploader :photo, PhotoUploader
end
