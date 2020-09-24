class InvitationsController < ApplicationController

  def show
    @customers = []
    distance_km = 100

    Customer.all.each do |customer|
      if distance_service.within_distance(customer, distance_km)
        @customers << customer
      end
    end

  end

  def create
    customer_service.read_customers

    redirect_to invitations_path
  end

  private

  def customer_service
    @customer_service ||= CustomerService.new
  end

  def distance_service
    @distance_service ||= DistanceService.new
  end

end
