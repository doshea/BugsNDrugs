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
#  bug_class_id      :integer
#  created_at        :datetime
#  updated_at        :datetime
#

class Bug < ActiveRecord::Base
  belongs_to :bug_class
  
  has_and_belongs_to_many :symptoms
  has_and_belongs_to_many :syndromes

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
