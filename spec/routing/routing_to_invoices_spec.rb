require 'rails_helper'

RSpec.describe "routing to invoices", type: :routing do
  it "routes /invoices/:id to invoices#show" do
    invoice = FactoryGirl.create(:invoice)
    expect(get: "/invoices/#{invoice.id}").to route_to(
      :controller => "invoices",
      :action     => "show",
      :id         => invoice.id.to_s
      )
  end

  it "routes /invoices/:invoice_id/invoice_items/:id/edit to invoice_items#edit" do
    invoice = FactoryGirl.build(:invoice)
    invoice.invoice_items = FactoryGirl.create_list(:invoice_item, 3)
    invoice.save!
    expect(get: "/invoices/#{invoice.id}/invoice_items/#{invoice.invoice_items.first.id}/edit").to route_to(
      :controller => "invoice_items",
      :action     => "edit",
      :invoice_id => invoice.id.to_s,
      :id         => invoice.invoice_items.first.id.to_s
      )
  end

end
