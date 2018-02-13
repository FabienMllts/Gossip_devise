require 'rails_helper'

RSpec.describe GossipsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Gossip. As you add validations to Gossip, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # GossipsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      gossip = Gossip.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      gossip = Gossip.create! valid_attributes
      get :show, params: {id: gossip.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      gossip = Gossip.create! valid_attributes
      get :edit, params: {id: gossip.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Gossip" do
        expect {
          post :create, params: {gossip: valid_attributes}, session: valid_session
        }.to change(Gossip, :count).by(1)
      end

      it "redirects to the created gossip" do
        post :create, params: {gossip: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Gossip.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {gossip: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested gossip" do
        gossip = Gossip.create! valid_attributes
        put :update, params: {id: gossip.to_param, gossip: new_attributes}, session: valid_session
        gossip.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the gossip" do
        gossip = Gossip.create! valid_attributes
        put :update, params: {id: gossip.to_param, gossip: valid_attributes}, session: valid_session
        expect(response).to redirect_to(gossip)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        gossip = Gossip.create! valid_attributes
        put :update, params: {id: gossip.to_param, gossip: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested gossip" do
      gossip = Gossip.create! valid_attributes
      expect {
        delete :destroy, params: {id: gossip.to_param}, session: valid_session
      }.to change(Gossip, :count).by(-1)
    end

    it "redirects to the gossips list" do
      gossip = Gossip.create! valid_attributes
      delete :destroy, params: {id: gossip.to_param}, session: valid_session
      expect(response).to redirect_to(gossips_url)
    end
  end

end