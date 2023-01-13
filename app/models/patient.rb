class Patient < ApplicationRecord

  belongs_to :user

  has_many :addresses, dependent: :destroy
  has_many :contacts, dependent: :destroy

  accepts_nested_attributes_for :addresses, :contacts, allow_destroy: true

  def name
    "##{id} | #{last_name} #{first_name}"
  end

  def current_address
    adresses.last
  end
end
