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
  include ViewsDecorator
  belongs_to :author
  has_many :wish_lists

  scope :wished_by, -> (user) {joins(:wish_lists).where(wish_lists: {user_id: user})}

   mount_uploader :photo, PhotoUploader

  def title_description
    super(self.name)
  end

  def short_description
    super self.name
  end

  def get_image
    super(self.photo_url)
  end
end
