require 'rails_helper'

RSpec.describe BoardsController, type: :controller do
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:board) { Board.create( title: Faker::FunnyName.name , description: Faker::Lorem.sentence) }
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: {id: board.id}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Board" do
        expect {
          post :create, params: {title: Faker::FunnyName.name}, session: valid_session
        }.to change(Board, :count).by(1)
      end

      it "redirects to the created board" do
        post :create, params: {title: Faker::FunnyName.name}, session: valid_session
        expect(response).to redirect_to(root_path)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        expect{
          put :create, params: {}, session: valid_session
        }.to raise_error(ActiveRecord::StatementInvalid)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested board" do
        put :update, params: {id: board.id, title: Faker::FunnyName.name}, session: valid_session
        expect(Board.count).to eq(1)
      end

      it "redirects to the board" do
        put :update, params: {id: board.id, title: Faker::FunnyName.name}, session: valid_session
        expect(response).to redirect_to(root_path)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        expect{
          put :create, params: {}, session: valid_session
        }.to raise_error(ActiveRecord::StatementInvalid)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested board" do
      delete :destroy, params: {id: board.id}, session: valid_session
      expect(Board.count).to eq(0)
    end

    it "redirects to the boards list" do
      delete :destroy, params: {id: board.id}, session: valid_session
      expect(response).to redirect_to(root_path)
    end
  end
end
