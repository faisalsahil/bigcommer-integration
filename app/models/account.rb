class Account < ActiveRecord::Base
  has_many :products
end
