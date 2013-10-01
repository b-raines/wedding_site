class UpdateDefaultFilepickerUrl < ActiveRecord::Migration
  def change
    change_column :users, :filepicker_url, :string, default: "https://s3-us-west-2.amazonaws.com/nicole-brent-wedding/7CNi1iQzTNC7P16SW07k_placeholder.jpg"
  end
end
