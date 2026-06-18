class Report < ApplicationRecord
  validates :company_domain, presence: true, uniqueness: true
end
