class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :description
      t.date :billing_date
      t.datetime :submitted_at
      t.text :client_area
      t.decimal :amount

      t.timestamps null: false
    end
  end
end
