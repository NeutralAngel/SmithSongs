require 'spec_helper'

describe "orders/index" do
  before(:each) do
    assign(:orders, [
      stub_model(Order,
        :name => "Name",
        :address => "MyText",
        :stripe_token => "Stripe Token"
      ),
      stub_model(Order,
        :name => "Name",
        :address => "MyText",
        :stripe_token => "Stripe Token"
      )
    ])
  end

  it "renders a list of orders" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Stripe Token".to_s, :count => 2
  end
end
