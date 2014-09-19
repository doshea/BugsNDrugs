# == Schema Information
#
# Table name: drug_classes
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  tier          :integer
#  description   :text
#  order         :integer
#  drug_class_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class DrugClass < ActiveRecord::Base

  belongs_to :drug_class, inverse_of: :drug_classes
  has_many :drug_classes, inverse_of: :drug_class

  has_many :subclasses, class_name: 'DrugClass', foreign_key: 'drug_class_id'
  belongs_to :superclass, class_name: 'DrugClass', foreign_key: 'drug_class_id'

  has_many :drugs, inverse_of: :drug_class
  has_many :leafs, class_name: 'Drug', foreign_key: 'drug_class_id'

  scope :top_tier, -> { where(tier: 0) }

  def child_count
    # TODO make this use a counter, it is way too CPU intensive
    preliminary_count = subclasses.map{|bc| bc.child_count}.reduce(:+)
    preliminary_count ? preliminary_count + leafs.count : leafs.count
  end

  def children
    bug_classes + bugs
  end

  def siblings
    bug_class.children - [self]
  end

  def add_child_class(name, options={})
    new_child_class = self.class.new(
      name: name,
      tier: options[:tier] || (tier + 1),
      order: options[:order] || (highest_order_child + 1),
    )
    subclasses << new_child_class
    new_child_class
  end

  def add_child_classes(children_array)
    children_array.map{|child| add_child_class(child)}
  end

  def add_leafs(leaf_array)
    leaf_array.each do |leaf|
      if leaf.class == String
        leafs << Drug.new(generic_name: leaf)
      elsif leaf.class == Drug
        leafs << leaf
      end
    end
  end

  private
  def highest_order_child
    drug_classes.pluck(:order).max || 0
  end

end
