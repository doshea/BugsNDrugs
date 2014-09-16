# == Schema Information
#
# Table name: drugs
#
#  id            :integer          not null, primary key
#  generic_name  :string(255)      not null
#  chemical_name :string(255)
#  trade_name    :string(255)
#  description   :text
#  pending       :boolean
#  drug_class_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class Drug < ActiveRecord::Base
  belongs_to :drug_class
  belongs_to :branch, class_name: 'DrugClass', foreign_key: 'drug_class_id'

end
