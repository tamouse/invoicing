# == Schema Information
#
# Table name: invoices
#
#  id           :integer          not null, primary key
#  description  :string
#  billing_date :date
#  submitted_at :datetime
#  client_area  :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryGirl.define do
  factory :invoice do
    description { "Invoice for My Client, #{Date.today.month}, #{Date.today.year}" }
    billing_date { Date.new(Date.today.year, Date.today.month, 1) }
    submitted_at { DateTime.now }
    client_area "My Client"
  end
end
