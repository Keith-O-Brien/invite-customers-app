require 'rails_helper'

RSpec.describe DistanceService do
  distance_service = DistanceService.new

  customer_in_cork = Customer.new(
      name: 'Michael O Sullivan',
      longitude: -8.465346, # Coordinates for Cork city hall
      latitude: 51.897208
  )

  customer_in_dublin = Customer.new(
      name: 'James O Connor',
      longitude: -6.257026, # Coordinates for Trinity College Dublin
      latitude: 53.344355
  )

  describe "within distance function" do
    it "returns a boolean" do
      kilometre_distance = 100
      result = distance_service.is_within_distance(customer_in_cork, kilometre_distance)

      expect(result).to be_in([true, false])
    end

    it "returns true for customer within distance" do
      kilometre_distance = 100
      result = distance_service.is_within_distance(customer_in_dublin, kilometre_distance)

      expect(result).to be true
    end

    it "returns false for customer outside of distance" do
      kilometre_distance = 50
      result = distance_service.is_within_distance(customer_in_cork, kilometre_distance)

      expect(result).to be false
    end
  end

end
