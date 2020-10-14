Category.destroy_all
User.destroy_all

category_list = [
  { name: "City" },
  { name: "LongTrip" },
  { name: "Mountain" },
  { name: "Working" }
]

category_list.each do |category|
  Category.create(name: category[:name])
end

puts "Category created!"

User.create(email: ENV["ADMIN_COUNT"], 
            password: ENV["ADMIN_PASSWORD"], 
            role: 0,
            confirmed_at: Time.now.utc)
puts "Default admin created!"