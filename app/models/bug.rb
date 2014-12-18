# == Schema Information
#
# Table name: bugs
#
#  id                :integer          not null, primary key
#  name              :string(255)      not null
#  common_name       :string(255)
#  gram_stain        :string(255)
#  environment       :string(255)
#  morphology        :string(255)
#  growth_pattern    :string(255)
#  description       :text
#  brief_description :string(255)
#  toxins            :text
#  order             :integer
#  image             :text
#  bug_class_id      :integer
#  motile            :boolean          default(FALSE)
#  encapsulated      :boolean          default(FALSE)
#  pending           :boolean
#  created_at        :datetime
#  updated_at        :datetime
#

class Bug < ActiveRecord::Base
  belongs_to :bug_class
  belongs_to :branch, class_name: 'BugClass', foreign_key: 'bug_class_id'
  
  # has_and_belongs_to_many :symptoms
  # has_and_belongs_to_many :syndromes

  mount_uploader :image, BugPicUploader

  def abbreviated_initial
    array = name.split(' ')
    if array.length > 1
      first_word = array.shift
      first_word = "#{first_word[0]}."
      array.unshift(first_word).join(' ')
    else
      name
    end
  end


  # default_scope { order(:order)}
end
