require 'rails_helper'

RSpec.describe MiningJob, type: :job do
  it "increases user resources by its factory rate per 1s" do
    user = create(:user)

    described_class.perform_now(user)

    user.reload
    expect(user.iron).to eq(10)
    expect(user.copper).to eq(3)
    expect(user.gold).to eq(1.0 / 60.0)
  end
end
