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

RSpec.describe PratosController, type: :controller do


  before do
    Restaurante.create!(nome: "Hamburgueria")
  end

  # This should return the minimal set of attributes required to create a valid
  # Prato. As you add validations to Prato, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {{"nome" => "MyString", "preco" => 12.13, "restaurante_id" => Restaurante.first.id}}

  let(:invalid_attributes) {{"nome" => ""}}

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PratosController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      prato = Prato.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      prato = Prato.create! valid_attributes
      get :show, params: {id: prato.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Prato" do
        expect {
          post :create, params: {prato: valid_attributes}, session: valid_session
        }.to change(Prato, :count).by(1)
      end

      it "renders a JSON response with the new prato" do

        post :create, params: {prato: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(prato_url(Prato.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new prato" do

        post :create, params: {prato: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {{"nome" => "MyString2", "preco" => 10.15, "restaurante_id" => Restaurante.first.id}}

      it "updates the requested prato" do
        prato = Prato.create! valid_attributes
        put :update, params: {id: prato.to_param, prato: new_attributes}, session: valid_session
        prato.reload
        expect(response).to be_success
      end

      it "renders a JSON response with the prato" do
        prato = Prato.create! valid_attributes

        put :update, params: {id: prato.to_param, prato: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the prato" do
        prato = Prato.create! valid_attributes

        put :update, params: {id: prato.to_param, prato: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested prato" do
      prato = Prato.create! valid_attributes
      expect {
        delete :destroy, params: {id: prato.to_param}, session: valid_session
      }.to change(Prato, :count).by(-1)
    end
  end

end
