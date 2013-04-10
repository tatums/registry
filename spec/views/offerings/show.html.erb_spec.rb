require 'spec_helper'

describe "offerings/show" do
  before(:each) do
    @offering = assign(:offering, stub_model(Offering,
      :title => "Title",
      :description => "Description",
      :amount => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Description/)
    rendered.should match(/9.99/)
  end
end
