# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  full_name              :string
#  identification         :string
#  type_identification    :string           default("0"), not null
#  birth_date             :date
#  role                   :string           default("usuario"), not null
#  book_score             :float            default(5.0)
#  profile                :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class User < ApplicationRecord
  include ViewsDecorator
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :wish_lists

  mount_uploader :profile, PhotoUploader
  enum role: {usuario: '-1', admin: '1'}

  def get_image
    super self.profile_url
  end

  def other_description
    super "#{self.email} | #{self.role}"
  end

  def short_description
    super (self.full_name || self.email)
  end
end
