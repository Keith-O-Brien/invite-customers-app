require 'rails_helper'

RSpec.describe Customer, type: :model do
  it "is not valid without a name" do
    customer = Customer.new(name: nil)
    expect(customer).to_not be_valid
  end

  it "is not valid without a longitude value" do
    customer = Customer.new(longitude: nil)
    expect(customer).to_not be_valid
  end

  it "is not valid without a latitude value" do
    customer = Customer.new(latitude: nil)
    expect(customer).to_not be_valid
  end

  it "is valid with valid attributes" do
    customer = Customer.new(name: "Tom Hanks", latitude: 52.228056, longitude: -7.915833)
    expect(customer).to be_valid
  end
end
