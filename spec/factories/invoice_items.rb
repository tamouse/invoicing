# == Schema Information
#
# Table name: invoice_items
#
#  id             :integer          not null, primary key
#  invoice_id     :integer
#  description    :string
#  billable_units :string
#  units          :decimal(, )
#  rate           :decimal(, )
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

FactoryGirl.define do
  factory :invoice_item do
    invoice nil
    description "billable work for week"
    billable_units "hours"
    units "30"
    rate "45"
  end
end
