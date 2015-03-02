class InvoiceItemsController < ApplicationController
  before_action :set_invoice
  before_action :set_invoice_item, only: [:show, :edit, :update, :destroy]

  def index
    @invoice_items = @invoice.invoice_items
  end

  def show
  end

  def new
    @invoice_item = @invoice.invoice_items.new
  end

  def edit
  end

  def create
    @invoice_item = @invoice.invoice_items.new(invoice_item_params)

    respond_to do |format|
      if @invoice_item.save
        format.html { redirect_to @invoice, notice: 'Invoice item was successfully created.' }
        format.json { render :show, status: :created, location: @invoice_item }
      else
        format.html { render :new }
        format.json { render json: @invoice_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @invoice_item.update(invoice_item_params)
        format.html { redirect_to @invoice, notice: 'Invoice item was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoice_item }
      else
        format.html { render :edit }
        format.json { render json: @invoice_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @invoice_item.destroy
    respond_to do |format|
      format.html { redirect_to @invoice, notice: 'Invoice item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_invoice
    @invoice = Invoice.find(params[:invoice_id])
  end
  
  def set_invoice_item
    @invoice_item = @invoice.invoice_items.find(params[:id])
  end

  def invoice_item_params
    params.require(:invoice_item).permit!
  end
end
