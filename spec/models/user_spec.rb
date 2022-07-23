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

  describe "#iron_rate" do
    it "returns rate depending on the level" do
      user = create(:user)
      other_user = create(:user, iron_level: 3)

      expect(user.iron_rate).to eq(10)
      expect(other_user.iron_rate).to eq(40)
    end
  end

  describe "#copper_rate" do
    it "returns rate depending on the level" do
      user = create(:user)
      other_user = create(:user, copper_level: 4)

      expect(user.copper_rate).to eq(3)
      expect(other_user.copper_rate).to eq(30)
    end
  end

  describe "#gold_rate" do
    it "returns rate depending on the level" do
      user = create(:user)
      other_user = create(:user, gold_level: 5)

      expect(user.gold_rate).to eq(2 / 60.0)
      expect(other_user.gold_rate).to eq(8 / 60.0)
    end
  end
end
