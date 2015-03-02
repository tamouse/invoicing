require 'rails_helper'
RSpec.describe InvoiceItemsController, :type => :controller do

  let(:valid_attributes) { FactoryGirl.attributes_for(:invoice_item).reject{|k,_| k == :invoice} }
  let(:invalid_attributes) { {description: "bogus invoice item", units: nil, rate: nil } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # InvoiceItemsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET new" do
    it "assigns a new invoice_item as @invoice_item" do
      invoice = FactoryGirl.create :invoice
      get :new, {invoice_id: invoice.to_param}, valid_session
      expect(assigns(:invoice_item)).to be_a_new(InvoiceItem)
    end
  end

  describe "GET edit" do
    it "assigns the requested invoice_item as @invoice_item" do
      invoice = FactoryGirl.create :invoice
      invoice_item = invoice.invoice_items.create! valid_attributes
      get :edit, {invoice_id: invoice.to_param, :id => invoice_item.to_param}, valid_session
      expect(assigns(:invoice_item)).to eq(invoice_item)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new InvoiceItem" do
        invoice = FactoryGirl.create :invoice
        expect {
          post :create, {invoice_id: invoice.to_param, :invoice_item => valid_attributes}, valid_session
        }.to change(InvoiceItem, :count).by(1)
      end

      it "assigns a newly created invoice_item as @invoice_item" do
        invoice = FactoryGirl.create :invoice
        post :create, {invoice_id: invoice.to_param, :invoice_item => valid_attributes}, valid_session
        expect(assigns(:invoice_item)).to be_a(InvoiceItem)
        expect(assigns(:invoice_item)).to be_persisted
      end

      it "redirects to the created invoice_item" do
        invoice = FactoryGirl.create :invoice
        post :create, {invoice_id: invoice.to_param, :invoice_item => valid_attributes}, valid_session
        expect(response).to redirect_to(invoice)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved invoice_item as @invoice_item" do
        invoice = FactoryGirl.create :invoice
        post :create, {invoice_id: invoice.to_param, :invoice_item => invalid_attributes}, valid_session
        expect(assigns(:invoice_item)).to be_a_new(InvoiceItem)
      end

      it "re-renders the 'new' template" do
        invoice = FactoryGirl.create :invoice
        post :create, {invoice_id: invoice.to_param, :invoice_item => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        {rate: 55}
      }

      it "updates the requested invoice_item" do
        invoice = FactoryGirl.create :invoice
        invoice_item = invoice.invoice_items.create! valid_attributes
        put :update, {invoice_id: invoice.to_param, :id => invoice_item.to_param, :invoice_item => new_attributes}, valid_session
        invoice_item.reload
        expect(invoice_item.rate).to eq(55)
      end

      it "assigns the requested invoice_item as @invoice_item" do
        invoice = FactoryGirl.create :invoice
        invoice_item = invoice.invoice_items.create! valid_attributes
        put :update, {invoice_id: invoice.to_param, :id => invoice_item.to_param, :invoice_item => valid_attributes}, valid_session
        expect(assigns(:invoice_item)).to eq(invoice_item)
      end

      it "redirects to the invoice_item" do
        invoice = FactoryGirl.create :invoice
        invoice_item = invoice.invoice_items.create! valid_attributes
        put :update, {invoice_id: invoice.to_param, :id => invoice_item.to_param, :invoice_item => valid_attributes}, valid_session
        expect(response).to redirect_to(invoice)
      end
    end

    describe "with invalid params" do
      it "assigns the invoice_item as @invoice_item" do
        invoice = FactoryGirl.create :invoice
        invoice_item = invoice.invoice_items.create! valid_attributes
        put :update, {invoice_id: invoice.to_param, :id => invoice_item.to_param, :invoice_item => invalid_attributes}, valid_session
        expect(assigns(:invoice_item)).to eq(invoice_item)
      end

      it "re-renders the 'edit' template" do
        invoice = FactoryGirl.create :invoice
        invoice_item = invoice.invoice_items.create! valid_attributes
        put :update, {invoice_id: invoice.to_param, :id => invoice_item.to_param, :invoice_item => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested invoice_item" do
      invoice = FactoryGirl.create :invoice
      invoice_item = invoice.invoice_items.create! valid_attributes
      expect {
        delete :destroy, {invoice_id: invoice.to_param, :id => invoice_item.to_param}, valid_session
      }.to change(InvoiceItem, :count).by(-1)
    end

    it "redirects to the invoice_items list" do
      invoice = FactoryGirl.create :invoice
      invoice_item = invoice.invoice_items.create! valid_attributes
      delete :destroy, {invoice_id: invoice.to_param, :id => invoice_item.to_param}, valid_session
      expect(response).to redirect_to(invoice)
    end
  end

end
