# == Schema Information
#
# Table name: locations
#
#  id            :integer          not null, primary key
#  name          :string
#  street_number :string
#  street_name   :string
#  city          :string
#  state         :string
#  zip           :string
#  date          :string
#  time          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  info          :text
#

require 'spec_helper'
