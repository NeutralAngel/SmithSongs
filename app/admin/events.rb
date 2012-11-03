ActiveAdmin.register Event do

   # form :partial => "form"
  form do |f| 
    f.inputs "Whatever" do
      f.input :venue
      f.input :event_date, :as=> :date_select
      f.input :begin_time, :as => :time_select, :ignore_date => false
      f.input :end_time
      f.input :title
      f.input :description
    end
    f.actions
  end
  
end
