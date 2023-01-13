class User < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  has_many :patients, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :contacts, dependent: :destroy
  
  def name
    email
  end
end
