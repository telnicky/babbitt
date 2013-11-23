require 'spec_helper'

describe "hearts/show" do
  before(:each) do
    @heart = assign(:heart, stub_model(Heart,
      :bpm => 1,
      :so2_sat => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
