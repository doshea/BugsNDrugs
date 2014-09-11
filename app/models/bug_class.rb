# == Schema Information
#
# Table name: bug_classes
#
#  id           :integer          not null, primary key
#  name         :string(255)      not null
#  tier         :integer
#  order        :integer
#  bug_class_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class BugClass < ActiveRecord::Base
  belongs_to :bug_class
  has_many :bug_classes
  has_many :bugs, -> { order(:order) }

  scope :top_tier, -> { where(tier: 1) }


  def child_count
    # TODO make this use a counter, it is way too CPU intensive
    preliminary_count = bug_classes.map{|bc| bc.child_count}.reduce(:+)
    preliminary_count ? preliminary_count + bugs.count : bugs.count
  end

  def children
    bug_classes + bugs
  end

  def siblings
    bug_class.children - [self]
  end

  def add_child_class(name, options={})
    new_child_class = BugClass.new(
      name: name,
      tier: options[:tier] || (tier + 1),
      order: options[:order] || (highest_order_child + 1),
    )
    bug_classes << new_child_class
    new_child_class
  end

  def add_child_classes(children_array)
    children_array.map{|child| add_child_class(child)}
  end

  def add_bugs(bug_array)
    bug_array.each{|b| bugs << Bug.new(name: b)}
  end

  private
  def highest_order_child
    bug_classes.pluck(:order).max || 0
  end


end
