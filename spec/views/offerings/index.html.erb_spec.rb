require 'spec_helper'

describe "offerings/index" do
  before(:each) do
    assign(:offerings, [
      stub_model(Offering,
        :title => "Title",
        :description => "Description",
        :amount => "9.99"
      ),
      stub_model(Offering,
        :title => "Title",
        :description => "Description",
        :amount => "9.99"
      )
    ])
  end

  it "renders a list of offerings" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
