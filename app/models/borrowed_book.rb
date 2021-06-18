# == Schema Information
#
# Table name: borrowed_books
#
#  id          :bigint           not null, primary key
#  book_id     :bigint           not null
#  user_id     :bigint           not null
#  status      :string           default("pendiente")
#  limit_date  :date
#  return_date :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class BorrowedBook < ApplicationRecord
  belongs_to :book
  belongs_to :user

  enum status: {pendiente: '0-', aprobado: '1', cancelado: '2', finalizado: '3', entrega_retasada: '4' }
end
