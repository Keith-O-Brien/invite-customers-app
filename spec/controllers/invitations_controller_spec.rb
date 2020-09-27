require 'rails_helper'

RSpec.describe InvitationsController, type: :controller do
  describe "GET show" do
    it "returns a successful response" do
      get :show
      expect(response).to be_successful
    end

    it "renders the show template" do
      get :show
      expect(response).to render_template("show")
    end
  end

  describe "POST create" do
    it "redirects to root with flash notice if print_to parameter is blank" do
      post :create
      expect(flash[:notice]).to be_present
      expect(response).to redirect_to(root_path)
    end

    it "redirects to show with file parameter if print_to parameter is set to file" do
      post :create, params: { print_to: :file }
      expect(response).to redirect_to(invitations_path(print_to: :file))
    end

    it "redirects to show with on_screen parameter if print_to parameter is set to on screen" do
      post :create, params: { print_to: :on_screen }
      expect(response).to redirect_to(invitations_path(print_to: :on_screen))
    end
  end

end