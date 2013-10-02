namespace :db do
  desc "Create admin user"
  task admin: :environment do
    make_admin
  end
end

def make_admin
  admin = User.create!(name: "Brent Raines",
                       email: "bt.raines@gmail.com",
                       relation: "Groom",
                       password: "braines87",
                       password_confirmation: "braines87",
                       admin: true)
end