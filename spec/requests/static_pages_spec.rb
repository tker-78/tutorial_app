require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  describe "GET /home" do
    it "returns http success" do
      get root_path
      expect(response).to have_http_status(:success)
      assert_select "title", "home | Ruby on Rails Tutorial Sample App"
    end
  end

  describe "GET /help" do
    it "returns http success" do
      get help_path 
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /about" do
    it "returns http success" do
      get about_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /contact" do
    it "returns http success" do
      get contact_path
      expect(response).to have_http_status(:success)
    end
  end

end
