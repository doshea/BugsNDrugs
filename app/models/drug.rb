# == Schema Information
#
# Table name: drugs
#
#  id             :integer          not null, primary key
#  generic_name   :string(255)      not null
#  chemical_name  :string(255)
#  trade_name     :string(255)
#  mechanism      :text
#  administered   :string(255)
#  metabolized_in :string(255)
#  csf            :boolean
#  toxicities     :string(255)
#  obscure        :boolean
#  pending        :boolean
#  drug_class_id  :integer
#  order          :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class Drug < ActiveRecord::Base
  belongs_to :drug_class
  belongs_to :branch, class_name: 'DrugClass', foreign_key: 'drug_class_id'

  has_many :side_effects, dependent: :destroy
  has_many :symptoms, through: :side_effects, source: :effectable, source_type: 'Symptom'
  has_many :syndromes, through: :side_effects, source: :effectable, source_type: 'Syndrome'

  include PgSearch
  pg_search_scope :starts_with,
    against: [:generic_name, :chemical_name, :trade_name],
    using: {
      tsearch: {prefix: true}
    }

  def tox_to_a
    toxicities.present? ? toxicities.split(/, ?/) : ['None']
  end
end
