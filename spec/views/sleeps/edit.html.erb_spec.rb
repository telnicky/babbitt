require 'spec_helper'

describe "sleeps/edit" do
  before(:each) do
    @sleep = assign(:sleep, stub_model(Sleep,
      :integer => "MyString",
      :datetime => "",
      :datetime => ""
    ))
  end

  it "renders the edit sleep form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sleep_path(@sleep), "post" do
      assert_select "input#sleep_integer[name=?]", "sleep[integer]"
      assert_select "input#sleep_datetime[name=?]", "sleep[datetime]"
      assert_select "input#sleep_datetime[name=?]", "sleep[datetime]"
    end
  end
end
