class Contact < ApplicationRecord
  belongs_to :patient

  CONTACTS_TYPE = { 
    1 => "Phone", 
    2 => "Email" 
  }.freeze

  def name
    contact_value
  end
end
