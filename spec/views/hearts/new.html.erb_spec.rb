require 'spec_helper'

describe "hearts/new" do
  before(:each) do
    assign(:heart, stub_model(Heart,
      :bpm => 1,
      :so2_sat => 1
    ).as_new_record)
  end

  it "renders new heart form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", hearts_path, "post" do
      assert_select "input#heart_bpm[name=?]", "heart[bpm]"
      assert_select "input#heart_so2_sat[name=?]", "heart[so2_sat]"
    end
  end
end
