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

require 'rails_helper'

RSpec.describe InvoiceItem, :type => :model do
  it "calculates the correct amount for a line item before saving" do
    line = InvoiceItem.new(rate: 45, units: 20)
    expect(line.amount).to eq( 45 * 20 )
  end
end
