require 'rails_helper'

RSpec.describe Invoice, :type => :model do
  it "calculates the invoice total correctly" do
    invoice = FactoryGirl.build(:invoice)
    invoice.invoice_items = FactoryGirl.create_list(:invoice_item, 3, rate: 10, units: 10)
    expect(invoice.amount).to be_nil
    invoice.save
    expect(invoice.amount).to eq( 3 * 10 * 10)
  end

end
