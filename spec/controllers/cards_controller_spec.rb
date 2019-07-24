require 'rails_helper'

RSpec.describe CardsController, type: :controller do
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Card" do
        expect {
          post :create, params: {card: valid_attributes}, session: valid_session
        }.to change(Card, :count).by(1)
      end

      it "redirects to the created card" do
        post :create, params: {card: valid_attributes}, session: valid_session
        expect(Board.count).to redirect_to(Card.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {card: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested card" do
        card = Card.create! valid_attributes
        put :update, params: {id: card.to_param, card: new_attributes}, session: valid_session
        card.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the card" do
        card = Card.create! valid_attributes
        put :update, params: {id: card.to_param, card: valid_attributes}, session: valid_session
        expect(response).to redirect_to(card)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        card = Card.create! valid_attributes
        put :update, params: {id: card.to_param, card: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested card" do
      card = Card.create! valid_attributes
      expect {
        delete :destroy, params: {id: card.to_param}, session: valid_session
      }.to change(Card, :count).by(-1)
    end

    it "redirects to the cards list" do
      card = Card.create! valid_attributes
      delete :destroy, params: {id: card.to_param}, session: valid_session
      expect(response).to redirect_to(cards_url)
    end
  end

end
