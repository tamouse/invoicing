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

require 'rails_helper'

RSpec.describe User, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
