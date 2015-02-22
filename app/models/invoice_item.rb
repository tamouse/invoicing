class InvoiceItem < ActiveRecord::Base
  belongs_to :invoice

  before_save :calculate_amount

  def calculate_amount
    self.amount = units * rate
  end
  
end
