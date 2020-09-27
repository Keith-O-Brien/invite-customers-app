require 'rails_helper'

RSpec.describe CustomerService do
  customer_service = CustomerService.new

  describe "read customers function" do
    it "returns results" do
      customers = customer_service.read_customers
      expect(customers).to_not be_empty
    end

    it "returns customer objects only" do
      customers = customer_service.read_customers
      expect(customers.last).to be_kind_of(Customer)
    end
  end

  describe "print customers to file function" do
    it "creates a file" do
      expect(File).to exist("#{Rails.root}/app/assets/text_files/customers_within_100_km.txt")
    end
  end

end
