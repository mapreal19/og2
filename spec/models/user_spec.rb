# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  it "starts with 0 mining resources" do
    user = create(:user)

    expect(user.iron).to eq(0)
    expect(user.copper).to eq(0)
    expect(user.gold).to eq(0)
  end

  it "starts with level 1 factories" do
    user = create(:user)

    expect(user.iron_level).to eq(1)
    expect(user.copper_level).to eq(1)
    expect(user.gold_level).to eq(1)
  end

  it "can't set factory level higher than 5" do
    user = create(:user)

    user.iron_level = 6
    user.save

    expect(user.errors.full_messages).to include("Iron level must be in 1..5")
  end
end
