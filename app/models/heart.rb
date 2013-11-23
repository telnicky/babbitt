require 'lib/hierarchical'

class Heart < ActiveRecord::Base
  include ::Hierarchical
end
