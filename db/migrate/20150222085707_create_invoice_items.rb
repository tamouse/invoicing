class CreateInvoiceItems < ActiveRecord::Migration
  def change
    create_table :invoice_items do |t|
      t.belongs_to :invoice, index: true
      t.string :description
      t.string :billable_units
      t.decimal :units
      t.decimal :rate
      t.decimal :amount

      t.timestamps null: false
    end
    add_foreign_key :invoice_items, :invoices
  end
end
