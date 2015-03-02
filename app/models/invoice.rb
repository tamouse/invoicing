# == Schema Information
#
# Table name: invoices
#
#  id           :integer          not null, primary key
#  description  :string
#  billing_date :date
#  submitted_at :datetime
#  client_area  :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Invoice < ActiveRecord::Base
  has_many :invoice_items, dependent: :destroy

  validates_presence_of :description

  def amount
    invoice_items.map(&:amount).inject(0,&:+)
  end
end
