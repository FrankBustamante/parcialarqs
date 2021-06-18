# == Schema Information
#
# Table name: wish_lists
#
#  id         :bigint           not null, primary key
#  book_id    :bigint           not null
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class WishList < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :book_id, uniqueness: :user_id
end