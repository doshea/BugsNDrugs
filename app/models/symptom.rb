# == Schema Information
#
# Table name: symptoms
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  image      :text
#  pending    :boolean
#  created_at :datetime
#  updated_at :datetime
#

class Symptom < ActiveRecord::Base
end
