# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  it "starts with 0 mining resources" do
    user = create(:user)

    expect(user.iron).to eq(0)
    expect(user.copper).to eq(0)
    expect(user.gold).to eq(0)
  end
end
