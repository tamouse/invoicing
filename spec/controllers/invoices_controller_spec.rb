require 'rails_helper'

RSpec.describe InvoicesController, type: :controller do
  describe 'GET /invoices' do
    before do
      get :index
    end

    it "retrieves a set of invoices" do
      expect(response).to be_ok
    end
  end
end
