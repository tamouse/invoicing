require 'rails_helper'

RSpec.describe InvoiceItem, :type => :model do
  it "calculates the correct amount for a line item before saving" do
    line = InvoiceItem.new(rate: 45, units: 20)
    expect(line.amount).to be_nil
    line.save
    expect(line.amount).to eq( 45 * 20 )
  end

  it "forces the correct amount even if it's set to something else'" do
    line = InvoiceItem.new(rate: 45, units: 20, amount: 30)
    expect(line.amount).to eq(30)
    line.save
    expect(line.amount).to eq( 45 * 20 )
  end


end
