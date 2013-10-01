class ChangeFilepickerUrlToString < ActiveRecord::Migration
  def change
    change_column :users, :filepicker_url, :text, default: "https://s3-us-west-2.amazonaws.com/nicole-brent-wedding/GxVNWoGwRmODnIqlR0Mh_placeholder.svg"
  end
end
