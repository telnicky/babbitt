require 'spec_helper'

describe "sleeps/index" do
  before(:each) do
    assign(:sleeps, [
      stub_model(Sleep,
        :integer => "Integer",
        :datetime => "",
        :datetime => ""
      ),
      stub_model(Sleep,
        :integer => "Integer",
        :datetime => "",
        :datetime => ""
      )
    ])
  end

  it "renders a list of sleeps" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Integer".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
