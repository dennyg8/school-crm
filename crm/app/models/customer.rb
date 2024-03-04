class Customer < ApplicationRecord
    validates :full_name, presence: true
    validates :email_address, presence: true, if: -> { email_address.present? }
  
    def self.ransackable_attributes(auth_object = nil)
      %w[full_name phone_number email_address notes]
    end
  
    def self.ransackable_associations(auth_object = nil)
      []
    end
    has_one_attached :image
end
