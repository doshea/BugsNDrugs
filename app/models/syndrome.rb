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
  has_and_belongs_to_many :symptoms
  
  has_many :side_effects, as: :taggable, dependent: :destroy
  has_many :drugs, through: :side_effects

end
