require 'spec_helper'

describe "sleeps/index" do
  before(:each) do
    assign(:sleeps, [
      stub_model(Sleep,
        :index => 1
      ),
      stub_model(Sleep,
        :index => 1
      )
    ])
  end

  it "renders a list of sleeps" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
