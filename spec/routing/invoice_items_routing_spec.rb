require "rails_helper"

RSpec.describe InvoiceItemsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/invoices/1/invoice_items").to route_to("invoice_items#index", :invoice_id => "1")
    end

    it "routes to #new" do
      expect(:get => "/invoices/1/invoice_items/new").to route_to("invoice_items#new", :invoice_id => "1")
    end

    it "routes to #show" do
      expect(:get => "/invoices/1/invoice_items/1").to route_to("invoice_items#show", :id => "1", :invoice_id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/invoices/1/invoice_items/1/edit").to route_to("invoice_items#edit", :id => "1", :invoice_id => "1")
    end

    it "routes to #create" do
      expect(:post => "/invoices/1/invoice_items").to route_to("invoice_items#create", :invoice_id => "1")
    end

    it "routes to #update" do
      expect(:put => "/invoices/1/invoice_items/1").to route_to("invoice_items#update", :id => "1", :invoice_id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/invoices/1/invoice_items/1").to route_to("invoice_items#destroy", :id => "1", :invoice_id => "1")
    end

  end
end
