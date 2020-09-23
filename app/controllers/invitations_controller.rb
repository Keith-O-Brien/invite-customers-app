class InvitationsController < ApplicationController

  def create
    data = File.read("app/assets/text_files/customer_list.txt")
    data = data.gsub("{", "").split('}')
    
    redirect_to root_path
  end

end
