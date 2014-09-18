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
  has_and_belongs_to_many :syndromes

  has_many :side_effects, as: :taggable, dependent: :destroy
  has_many :drugs, through: :side_effects
end
