Category.destroy_all

category_list = [
  { name: "City" },
  { name: "Long Trip" },
  { name: "Mountain" },
  { name: "Working" }
]

category_list.each do |category|
  Category.create(name: category[:name])
end

puts "Category created!"

User.create(email: "admin@tbag.com", password: "123456", role: 0)
puts "Default admin created!"