# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Application", type: :request do
  describe "GET /" do
    it "works" do
      get "/"

      expect(response).to have_http_status(:ok)
    end
  end
end
