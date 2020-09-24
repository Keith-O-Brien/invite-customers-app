class Customer < ActiveRecord::Base
  validates :name, presence: true

  scope :radius, ->(radius) {
    "SELECT *
    FROM your_table
    WHERE ST_Distance_Sphere(the_geom, ST_MakePoint(your_lon,your_lat)) <= radius_mi * 1609.34"

  }
end
