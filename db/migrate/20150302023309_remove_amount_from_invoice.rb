class RemoveAmountFromInvoice < ActiveRecord::Migration
  def change
    remove_column :invoices, :amount, :decimal
  end
end
