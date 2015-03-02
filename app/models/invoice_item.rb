# == Schema Information
#
# Table name: invoice_items
#
#  id             :integer          not null, primary key
#  invoice_id     :integer
#  description    :string
#  billable_units :string
#  units          :decimal(, )
#  rate           :decimal(, )
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class InvoiceItem < ActiveRecord::Base
  belongs_to :invoice

  validates_presence_of :description, :units, :rate
  validates_numericality_of :units, :rate

  def amount
    units * rate
  end
  
end
