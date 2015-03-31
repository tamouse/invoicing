class InvoicesController < ApplicationController

  before_action :set_invoice, only: [:show, :edit, :update, :destroy, :submit]

  def index
    @invoices = Invoice.all.order(billing_date: :desc)
  end

  def show
  end

  def new
    redirect_to invoices_path, alert: "Not implemented yet"
  end

  def create
    redirect_to invoices_path, alert: "Not implemented yet"
  end

  def edit
    redirect_to invoices_path, alert: "Not implemented yet"
  end

  def update
    redirect_to invoices_path, alert: "Not implemented yet"
  end

  def destroy
    redirect_to invoices_path, alert: "Not implemented yet"
  end

  def submit
    if @invoice.update(submitted_at: DateTime.now)
      redirect_to invoices_path, notice: "Invoice '#{@invoice.description}' submitted"
    else
      redirect_to invoices_path, alert: "Submit failed!"
    end
  end

  private

  def set_invoice
    @invoice = Invoice.find(params[:id])
  end

end
