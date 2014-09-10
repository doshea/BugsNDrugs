class Bug < ActiveRecord::Base
  belongs_to :bug_class

  # default_scope { order(:order)}
end
