require 'rails_helper'

RSpec.describe CustomerService do
  customer_service = CustomerService.new

  describe "Read Customers Function" do
    it "returns results" do
      customers = customer_service.read_customers
      expect(customers).to_not be_empty
    end

    it "returns customer objects only" do
      customers = customer_service.read_customers
      expect(customers.last).to be_kind_of(Customer)
    end

    it "returns customer objects only" do
      customers = customer_service.read_customers
      expect(customers.last).to be_kind_of(Customer)
    end


  end
end
