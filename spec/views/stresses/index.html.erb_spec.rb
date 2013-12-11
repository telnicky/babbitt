require 'spec_helper'

describe "stresses/index" do
  before(:each) do
    assign(:stresses, [
      stub_model(Stress,
        :integer => "Integer",
        :datetime => "",
        :datetime => ""
      ),
      stub_model(Stress,
        :integer => "Integer",
        :datetime => "",
        :datetime => ""
      )
    ])
  end

  it "renders a list of stresses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Integer".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
