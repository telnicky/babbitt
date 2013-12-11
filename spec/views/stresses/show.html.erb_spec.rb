require 'spec_helper'

describe "stresses/show" do
  before(:each) do
    @stress = assign(:stress, stub_model(Stress,
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
