require 'spec_helper'

describe "sleeps/show" do
  before(:each) do
    @sleep = assign(:sleep, stub_model(Sleep,
      :integer => "Integer",
      :datetime => "",
      :datetime => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Integer/)
    rendered.should match(//)
    rendered.should match(//)
  end
end
