class RemoveAmountFromInvoiceItem < ActiveRecord::Migration
  def change
    remove_column :invoice_items, :amount, :decimal
  end
end
