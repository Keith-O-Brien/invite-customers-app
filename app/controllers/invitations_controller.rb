class InvitationsController < ApplicationController
  before_action :set_customers, only: :show

  def show
    @onscreen = params[:print_to].to_sym.eql?(:screen)

    unless @onscreen
      File.write('app/assets/text_files/customers_within_100_km.txt', @customers.pluck(:id, :name).map(&:to_s).join("\n"))
    end
  end

  def create
    customer_service.read_customers

    redirect_to invitations_path(print_to: params[:print_to])
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
