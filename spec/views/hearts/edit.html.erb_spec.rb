require 'spec_helper'

describe "hearts/edit" do
  before(:each) do
    @heart = assign(:heart, stub_model(Heart,
      :bpm => 1,
      :so2_sat => 1
    ))
  end

  it "renders the edit heart form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", heart_path(@heart), "post" do
      assert_select "input#heart_bpm[name=?]", "heart[bpm]"
      assert_select "input#heart_so2_sat[name=?]", "heart[so2_sat]"
    end
  end
end
