require 'spec_helper'

describe "offerings/edit" do
  before(:each) do
    @offering = assign(:offering, stub_model(Offering,
      :title => "MyString",
      :description => "MyString",
      :amount => "9.99"
    ))
  end

  it "renders the edit offering form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", offering_path(@offering), "post" do
      assert_select "input#offering_title[name=?]", "offering[title]"
      assert_select "input#offering_description[name=?]", "offering[description]"
      assert_select "input#offering_amount[name=?]", "offering[amount]"
    end
  end
end
