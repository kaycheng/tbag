namespace :dev do
  task vendor_fake: :environment do
    Vendor.destroy_all

    5.times do |i|
      Vendor.create!(
        title: Faker::Name.name,
        online: true
      )
    end

    puts "Vendor is created."
    puts "There are #{Vendor.count} vendors data."
  end

  task city_products: :environment do
    Product.destroy_all
    6.times do |i|
      Product.create!(
        name: Faker::Name.name,
        list_price: Faker::Number.between(from: 1800, to: 5400),
        sell_price: Faker::Number.between(from: 1500, to: 4800),
        on_sell: true,
        category_id: Category.find_by(name: 'City').id,
        vendor: Vendor.all.sample
      )
    end

    puts "The city datas were created."
  end

  task mountain_products: :environment do
    1.times do |i|
      Product.create!(
        name: Faker::Name.name,
        list_price: Faker::Number.between(from: 1800, to: 5400),
        sell_price: Faker::Number.between(from: 1500, to: 4800),
        on_sell: true,
        category_id: Category.find_by(name: 'Mountain').id,
        vendor: Vendor.all.sample
      )
    end

    puts "The mountain datas were created."
  end

  task longtrip_products: :environment do
    1.times do |i|
      Product.create!(
        name: Faker::Name.name,
        list_price: Faker::Number.between(from: 1800, to: 5400),
        sell_price: Faker::Number.between(from: 1500, to: 4800),
        on_sell: true,
        category_id: Category.find_by(name: 'LongTrip').id,
        vendor: Vendor.all.sample
      )
    end

    puts "The long trip datas were created."
  end

  task working_products: :environment do
    1.times do |i|
      Product.create!(
        name: Faker::Name.name,
        list_price: Faker::Number.between(from: 1800, to: 5400),
        sell_price: Faker::Number.between(from: 1500, to: 4800),
        on_sell: true,
        category_id: Category.find_by(name: 'Working').id,
        vendor: Vendor.all.sample
      )
    end

    puts "The working datas were created."
    puts "There are #{Product.count} products data"
  end
end