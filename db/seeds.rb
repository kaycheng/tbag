Category.destroy_all
Vendor.destroy_all
Product.destroy_all
User.destroy_all

# Category
category_list = [
  { name: "City" },
  { name: "LongTrip" },
  { name: "Mountain" },
  { name: "Working" }
]

category_list.each do |category|
  Category.create(name: category[:name])
end

puts "Categories are created!"

# Vendors
5.times do 
  Vendor.create!(
    title: Faker::Name.name,
    online: true 
  )
end

puts "Vendors are created!"

# Products
6.times do 
  p = Product.new(
    name: Faker::Name.name,
    list_price: Faker::Number.between(from: 1800, to: 5400),
    sell_price: Faker::Number.between(from: 1500, to: 4800),
    on_sell: true,
    category_id: Category.find_by(name: 'City').id,
    vendor: Vendor.all.sample
  )
  p.skus.new(
    spec: Faker::Name.name,
    quantity: Faker::Number.between(from: 10, to: 20)
  )
  p.save
end

4.times do 
  p = Product.new(
    name: Faker::Name.name,
    list_price: Faker::Number.between(from: 1800, to: 5400),
    sell_price: Faker::Number.between(from: 1500, to: 4800),
    on_sell: true,
    category_id: Category.find_by(name: 'Mountain').id,
    vendor: Vendor.all.sample
  )
  p.skus.new(
    spec: Faker::Name.name,
    quantity: Faker::Number.between(from: 10, to: 20)
  )
  p.save
end

5.times do 
  p = Product.new(
    name: Faker::Name.name,
    list_price: Faker::Number.between(from: 1800, to: 5400),
    sell_price: Faker::Number.between(from: 1500, to: 4800),
    on_sell: true,
    category_id: Category.find_by(name: 'LongTrip').id,
    vendor: Vendor.all.sample
  )
  p.skus.new(
    spec: Faker::Name.name,
    quantity: Faker::Number.between(from: 10, to: 20)
  )
  p.save
end

3.times do 
  p = Product.new(
    name: Faker::Name.name,
    list_price: Faker::Number.between(from: 1800, to: 5400),
    sell_price: Faker::Number.between(from: 1500, to: 4800),
    on_sell: true,
    category_id: Category.find_by(name: 'Working').id,
    vendor: Vendor.all.sample
  )
  p.skus.new(
    spec: Faker::Name.name,
    quantity: Faker::Number.between(from: 10, to: 20)
  )
  p.save
end

puts "There are #{Product.count} products data."
puts "There are #{Sku.count} skus data."

User.create(username: "tbagadmin",
            email: ENV["ADMIN_COUNT"], 
            password: ENV["ADMIN_PASSWORD"], 
            role: 0,
            confirmed_at: Time.now.utc)
puts "Default admin created!"

User.create(username: "tbagtest",
            email: "tbagtest@hot.tw",
            password: '123456',
            role: 1,
            confirmed_at: Time.now.utc)