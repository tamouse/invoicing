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

require 'rails_helper'

RSpec.describe Invoice, :type => :model do
  it "calculates the invoice total correctly" do
    invoice = FactoryGirl.build(:invoice)
    invoice.invoice_items = FactoryGirl.create_list(:invoice_item, 3, rate: 10, units: 10)
    expect(invoice.amount).to eq( 3 * 10 * 10)
  end

end
