require 'rails_helper'

RSpec.describe MiningJob, type: :job do
  it "increases users resources by its factory rate per 10s" do
    user = create(:user)
    other_user = create(:user)

    described_class.perform_now

    user.reload
    other_user.reload
    expect(user.iron).to eq(100)
    expect(user.copper).to eq(30)
    expect(user.gold).to eq(10.0 / 60.0)
    expect(other_user.iron).to eq(100)
  end
end
