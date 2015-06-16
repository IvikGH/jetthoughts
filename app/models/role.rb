class Role < ActiveRecord::Base
  has_many :users
  # load_and_authorize_resource
end
