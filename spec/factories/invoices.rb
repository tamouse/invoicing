FactoryGirl.define do
  factory :invoice do
    description { "Invoice for My Client, #{Date.today.month}, #{Date.today.year}" }
    billing_date { Date.new(Date.today.year, Date.today.month, 1) }
    submitted_at { DateTime.now }
    client_area "My Client"
  end
end
