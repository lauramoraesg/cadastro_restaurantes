require 'spec_helper'

describe "Pratos" do
  describe "GET /pratos" do
    it "works! (now write some real specs)" do
      get pratos_path
      expect(response).to have_http_status(200)
    end
  end
end
