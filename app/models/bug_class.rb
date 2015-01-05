# == Schema Information
#
# Table name: bug_classes
#
#  id           :integer          not null, primary key
#  name         :string(255)      not null
#  tier         :integer
#  order        :integer
#  image        :text
#  bug_class_id :integer
#  pending      :boolean
#  created_at   :datetime
#  updated_at   :datetime
#

class BugClass < ActiveRecord::Base
  belongs_to :bug_class, inverse_of: :bug_classes
  has_many :bug_classes, inverse_of: :bug_class

  belongs_to :superclass, class_name: 'BugClass', foreign_key: 'bug_class_id'
  has_many :subclasses, class_name: 'BugClass', foreign_key: 'bug_class_id'

  has_many :bugs, -> { order(:order) }, inverse_of: :bug_class
  has_many :leafs, class_name: 'Bug', foreign_key: 'bug_class_id'

  scope :top_tier, -> { where(tier: 0) }

  include PgSearch
  pg_search_scope :starts_with,
    against: [:name],
    using: {
      tsearch: {prefix: true}
    }

  def tiered_name
    '-' * tier + name
  end

  def child_count
    # TODO make this use a counter, it is way too CPU intensive
    preliminary_count = subclasses.map{|bc| bc.child_count}.reduce(:+)
    preliminary_count ? preliminary_count + leafs.count : leafs.count
  end

  def children
    subclasses + leafs
  end

  def siblings
    superclass.children - [self]
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

  def add_bugs(leaf_array)
    leaf_array.each{|b| bugs << Bug.new(name: b)}
  end

  private
  def highest_order_child
    bug_classes.pluck(:order).max || 0
  end


end
