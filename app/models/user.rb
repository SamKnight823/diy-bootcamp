class User < ActiveRecord::Base
  has_secure_password
  has_many :drills
  has_one :stat
end
