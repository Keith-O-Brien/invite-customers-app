class InvitationsController < ApplicationController

  def create
    customer_data = File.read("app/assets/text_files/customer_list.txt")
    puts "df"

    customer_data.each do |data|
      data = data.split(",")
      id = data[1]
      name = data[2]
      longitude = data[3]
      latitude = data[0]

      # Customer.find_or_create_by(id: id)
    end

    redirect_to root_path
  end

end
