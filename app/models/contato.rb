class Contato < ActiveRecord::Base
  validates_presence_of :nome
  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
  validates :email, uniqueness: true
end
