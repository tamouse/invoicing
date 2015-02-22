class Invoice < ActiveRecord::Base
  has_many :invoice_items, dependent: :destroy

  before_save :calculate_amount

  def calculate_amount
    self.amount = invoice_items.map(&:amount).inject(0,&:+)
  end
end
