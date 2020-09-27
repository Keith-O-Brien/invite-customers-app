class Customer < ActiveRecord::Base
  validates :name, :longitude, :latitude, presence: true

end
