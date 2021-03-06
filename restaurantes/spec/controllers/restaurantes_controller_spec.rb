require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.


RSpec.describe RestaurantesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Restaurante. As you add validations to Restaurante, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {{"nome" => "MyString"}}

  let(:invalid_attributes) {{"nome" => ""}}

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # RestaurantesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index - busca todos os restaurantes" do
    it "returns a success response" do
      restaurante = Restaurante.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      restaurante = Restaurante.create! valid_attributes
      get :show, params: {id: restaurante.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Restaurante" do
        expect {
          post :create, params: {restaurante: valid_attributes}, session: valid_session
        }.to change(Restaurante, :count).by(1)
      end

      it "renders a JSON response with the new restaurante" do

        post :create, params: {restaurante: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(restaurante_url(Restaurante.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new restaurante" do

        post :create, params: {restaurante: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {{"nome" => "MyString2"}}

      it "updates the requested restaurante" do
        restaurante = Restaurante.create! valid_attributes
        put :update, params: {id: restaurante.to_param, restaurante: new_attributes}, session: valid_session
        restaurante.reload
        expect(response).to be_success
      end

      it "renders a JSON response with the restaurante" do
        restaurante = Restaurante.create! valid_attributes

        put :update, params: {id: restaurante.to_param, restaurante: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the restaurante" do
        restaurante = Restaurante.create! valid_attributes

        put :update, params: {id: restaurante.to_param, restaurante: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested restaurante" do
      restaurante = Restaurante.create! valid_attributes
      expect {
        delete :destroy, params: {id: restaurante.to_param}, session: valid_session
      }.to change(Restaurante, :count).by(-1)
    end
  end

end



