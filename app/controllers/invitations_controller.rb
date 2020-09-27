class InvitationsController < ApplicationController
  before_action :set_customers, only: :show
  before_action :check_for_print_option, only: :create

  def show
    @print_to_file = params[:print_to]&.to_sym&.eql?(:file)

    if @print_to_file
      customer_service.print_customers_to_file(@customers)
    end
  end

  def create
    customers = customer_service.read_customers

    if customers.any?
      redirect_to invitations_path(print_to: params[:print_to])
    else
      flash[:notice] = "I'm sorry, we could not read any customers from that file. Please check file format"
      redirect_to root_path
    end
  end

  private

  def set_customers
    customer_ids = []
    distance_km = 100

    Customer.all.each do |customer|
      if distance_service.is_within_distance(customer, distance_km)
        customer_ids << customer.id
      end
    end

    @customers = Customer.where(id: customer_ids).order("id ASC")
  end

  def check_for_print_option
    if params[:print_to].nil?
      flash[:notice] = "Please select how you would like the customer information to be printed."
      return redirect_to root_path
    end
  end

  def customer_service
    @customer_service ||= CustomerService.new
  end

  def distance_service
    @distance_service ||= DistanceService.new
  end

end
