require 'spec_helper'

describe "offerings/new" do
  before(:each) do
    assign(:offering, stub_model(Offering,
      :title => "MyString",
      :description => "MyString",
      :amount => "9.99"
    ).as_new_record)
  end

  it "renders new offering form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", offerings_path, "post" do
      assert_select "input#offering_title[name=?]", "offering[title]"
      assert_select "input#offering_description[name=?]", "offering[description]"
      assert_select "input#offering_amount[name=?]", "offering[amount]"
    end
  end
end
