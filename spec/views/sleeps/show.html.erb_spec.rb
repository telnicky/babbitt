require 'spec_helper'

describe "sleeps/show" do
  before(:each) do
    @sleep = assign(:sleep, stub_model(Sleep,
      :index => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
