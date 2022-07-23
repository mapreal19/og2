require "rails_helper"

RSpec.describe MiningJob, type: :job do
  it "increases users resources by its factory rate per 10s" do
    user = create(:user)
    other_user = create(:user)

    described_class.perform_now

    user.reload
    other_user.reload
    expect(user.iron).to eq(100)
    expect(user.copper).to eq(30)
    expect(user.gold).to eq(20.0 / 60.0)
    expect(other_user.iron).to eq(100)
  end

  it "takes into account the level of the factory" do
    user = create(:user, iron_level: 2, copper_level: 4, gold_level: 3)

    described_class.perform_now

    user.reload
    expect(user.iron).to eq(200)
    expect(user.copper).to eq(300)
    expect(user.gold).to eq(40 / 60.0)
  end
end
