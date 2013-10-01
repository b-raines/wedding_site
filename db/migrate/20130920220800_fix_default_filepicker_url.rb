class FixDefaultFilepickerUrl < ActiveRecord::Migration
  def change
    change_column :users, :filepicker_url, :string, default: "https://s3-us-west-2.amazonaws.com/nicole-brent-wedding/OaKq7CyTbCDfPMmxIHkA_placeholder.jpg"
  end
end
