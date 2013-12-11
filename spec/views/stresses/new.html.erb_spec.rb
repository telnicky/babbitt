require 'spec_helper'

describe "stresses/new" do
  before(:each) do
    assign(:stress, stub_model(Stress,
      :integer => "MyString",
      :datetime => "",
      :datetime => ""
    ).as_new_record)
  end

  it "renders new stress form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", stresses_path, "post" do
      assert_select "input#stress_integer[name=?]", "stress[integer]"
      assert_select "input#stress_datetime[name=?]", "stress[datetime]"
      assert_select "input#stress_datetime[name=?]", "stress[datetime]"
    end
  end
end
