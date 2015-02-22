FactoryGirl.define do
  factory :invoice_item do
    invoice nil
    description "billable work for week"
    billable_units "hours"
    units "30"
    rate "45"
  end
end
