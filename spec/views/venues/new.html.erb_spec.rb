require 'spec_helper'

describe "venues/new" do
  before(:each) do
    assign(:venue, stub_model(Venue,
      :name => "MyString",
      :line1 => "MyString",
      :line2 => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip => "MyString"
    ).as_new_record)
  end

  it "renders new venue form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => venues_path, :method => "post" do
      assert_select "input#venue_name", :name => "venue[name]"
      assert_select "input#venue_line1", :name => "venue[line1]"
      assert_select "input#venue_line2", :name => "venue[line2]"
      assert_select "input#venue_city", :name => "venue[city]"
      assert_select "input#venue_state", :name => "venue[state]"
      assert_select "input#venue_zip", :name => "venue[zip]"
    end
  end
end
