require "rails_helper"

RSpec.describe Status, type: :model do
  it "is valid" do
    status = create(:status)
    expect(status.current_type).to eq("Paid")
  end

  it "is invalid" do
    status = build(:status, current_type: nil)
    status.save
    expect(status.id).to be_nil
  end
end
