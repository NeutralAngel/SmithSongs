require 'spec_helper'

describe "events/edit" do
  before(:each) do
    @event = assign(:event, stub_model(Event,
      :venue_id => 1,
      :steve_show => false,
      :title => "MyText",
      :description => "MyText"
    ))
  end

  it "renders the edit event form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => events_path(@event), :method => "post" do
      assert_select "input#event_venue_id", :name => "event[venue_id]"
      assert_select "input#event_steve_show", :name => "event[steve_show]"
      assert_select "textarea#event_title", :name => "event[title]"
      assert_select "textarea#event_description", :name => "event[description]"
    end
  end
end
