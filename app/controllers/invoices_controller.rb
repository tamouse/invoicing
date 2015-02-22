class InvoicesController < ApplicationController

  def index
    @invoices = Invoice.all.order(billing_date: :desc)
  end

  def show
    @invoice = Invoice.find(params[:id])
  end

end
