require 'rails_helper'

RSpec.describe DistanceService do
  distance_service = DistanceService.new

  describe "within distance function" do
    it "returns a boolean" do
      # kilometre_distance = 100
      # customer = Customer.last
      result = distance_service.is_within_distance(customer, kilometre_distance)

      # expect(result).to be(true).or be(false)
    end

  end

end
