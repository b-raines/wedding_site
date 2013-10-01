class AddInkpickerDefaultToFilepickerUrl < ActiveRecord::Migration
  def change
    change_column :users, :filepicker_url, :string, default: "https://www.filepicker.io/api/file/amtMMqVcSyW5Jr5lLxjR"
  end
end
