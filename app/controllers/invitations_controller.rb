class InvitationsController < ApplicationController
  before_action :set_customers, only: :show

  def show

  end

  def create
    customer_service.read_customers

    redirect_to invitations_path
  end

  private

  def set_customers
    customer_ids = []
    distance_km = 100

    Customer.all.each do |customer|
      if distance_service.within_distance(customer, distance_km)
        customer_ids << customer.id
      end
    end

    @customers = Customer.where(id: customer_ids).order("id ASC")
  end

  def customer_service
    @customer_service ||= CustomerService.new
  end

  def distance_service
    @distance_service ||= DistanceService.new
  end

end
