class Contact < ApplicationRecord

belongs_to :enduser

validates :contact, presence: true
validates :reply, presence: true

end
