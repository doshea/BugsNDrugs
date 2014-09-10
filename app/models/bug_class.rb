class BugClass < ActiveRecord::Base

  belongs_to :superclass, class_name: 'BugClass'
  has_many :subclasses, class_name: 'BugClass', foreign_key: 'superclass_id'
  has_many :bugs

  def self.universal_class
    'Bugs'
  end

  def self.node_0
    find_by(name: universal_class)
  end

end
