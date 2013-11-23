require 'spec_helper'

describe "hearts/index" do
  before(:each) do
    assign(:hearts, [
      stub_model(Heart,
        :bpm => 1,
        :so2_sat => 2
      ),
      stub_model(Heart,
        :bpm => 1,
        :so2_sat => 2
      )
    ])
  end

  it "renders a list of hearts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
