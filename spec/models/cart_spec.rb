require 'rails_helper'

RSpec.describe Cart, type: :model do
  it "can hold items" do
      assert Cart.new({"2" => 3})
  end
end
