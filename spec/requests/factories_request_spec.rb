require "rails_helper"

RSpec.describe "Factories", type: :request do
  describe "POST /level_up" do
    it "changes level of given factory" do
      user = create(:user, iron: 600, copper: 200, gold: 2)
      sign_in(user)

      post "/factories/level_up", params: { mining_resource: "iron" }

      user.reload
      expect(user.iron_level).to eq(2)
    end
  end
end
