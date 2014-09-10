class BugClass < ActiveRecord::Base

  belongs_to :drug_class, class_name: 'BugClass'
  has_many :subclasses, class_name: 'BugClass', foreign_key: 'drug_class_id'
  has_many :bugs, -> { order(:order) }

  def self.universal_class
    'Bugs'
  end

  def self.node_0
    find_by(name: universal_class)
  end

end
