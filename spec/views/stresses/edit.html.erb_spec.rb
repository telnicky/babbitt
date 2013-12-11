require 'spec_helper'

describe "stresses/edit" do
  before(:each) do
    @stress = assign(:stress, stub_model(Stress,
      :integer => "MyString",
      :datetime => "",
      :datetime => ""
    ))
  end

  it "renders the edit stress form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", stress_path(@stress), "post" do
      assert_select "input#stress_integer[name=?]", "stress[integer]"
      assert_select "input#stress_datetime[name=?]", "stress[datetime]"
      assert_select "input#stress_datetime[name=?]", "stress[datetime]"
    end
  end
end
