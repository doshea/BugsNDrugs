# == Schema Information
#
# Table name: syndromes
#
#  id         :integer          not null, primary key
#  pending    :boolean
#  created_at :datetime
#  updated_at :datetime
#

class Syndrome < ActiveRecord::Base
end
