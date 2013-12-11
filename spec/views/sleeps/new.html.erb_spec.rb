require 'spec_helper'

describe "sleeps/new" do
  before(:each) do
    assign(:sleep, stub_model(Sleep,
      :index => 1
    ).as_new_record)
  end

  it "renders new sleep form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sleeps_path, "post" do
      assert_select "input#sleep_index[name=?]", "sleep[index]"
    end
  end
end
