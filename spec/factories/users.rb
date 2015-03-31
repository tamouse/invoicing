# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  surname    :string
#  given_name :string
#  username   :string
#  nickname   :string
#  phone      :string
#  email      :string
#  birthday   :datetime
#  active     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :user do
    surname "MyString"
given_name "MyString"
username "MyString"
nickname "MyString"
phone "MyString"
email "MyString"
birthday "2015-03-31 21:40:45"
active false
  end

end
