class InvitationsController < ApplicationController


  def create
    customers = customer_service.read_customers

    redirect_to invitations_path
  end

  def show

  end

  private

  def customer_service
    @customer_service ||= CustomerService.new
  end

end
