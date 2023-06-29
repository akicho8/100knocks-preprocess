require "active_support/core_ext/object/with_options"
require "active_record"
require "table_format"
require "pathname"
require "csv"

ActiveRecord::VERSION::STRING   # => "7.0.5.1"
`mysql --version`.strip         # => "mysql  Ver 8.0.33 for macos13.3 on arm64 (Homebrew)"

system("mysql -u root -e 'DROP DATABASE IF EXISTS __test__; CREATE DATABASE __test__'") if false
ActiveRecord::Base.establish_connection(adapter: "mysql2", host: "127.0.0.1", database: "__test__", username: "root")

ActiveSupport::LogSubscriber.colorize_logging = false

ActiveRecord::Migration.verbose = false
ActiveRecord::Schema.define do
  with_options if_not_exists: true do
    create_table :categories do |t|
      t.string :category_major_cd
      t.string :category_major_name
      t.string :category_medium_cd
      t.string :category_medium_name
      t.string :category_small_cd
      t.string :category_small_name
    end

    create_table :customers do |t|
      t.string :customer_id
      t.string :customer_name
      t.string :gender_cd
      t.string :gender
      t.string :birth_day
      t.string :age
      t.string :postal_cd
      t.string :address
      t.string :application_store_cd
      t.string :application_date
      t.string :status_cd
    end

    create_table :geocodes do |t|
      t.string :postal_cd
      t.string :prefecture
      t.string :city
      t.string :town
      t.string :street
      t.string :address
      t.string :full_address
      t.string :longitude
      t.string :latitude
    end

    create_table :products do |t|
      t.string :product_cd
      t.string :category_major_cd
      t.string :category_medium_cd
      t.string :category_small_cd
      t.string :unit_price
      t.string :unit_cost
    end

    create_table :receipts do |t|
      t.string :sales_ymd
      t.string :sales_epoch
      t.string :store_cd
      t.integer :receipt_no
      t.integer :receipt_sub_no
      t.string :customer_id
      t.string :product_cd
      t.integer :quantity
      t.integer :amount
    end

    create_table :stores do |t|
      t.string :store_cd
      t.string :store_name
      t.integer :prefecture_cd
      t.string :prefecture
      t.string :address
      t.string :address_kana
      t.string :tel_no
      t.float :longitude
      t.float :latitude
      t.float :floor_area
    end
  end
end

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end

class Category < ApplicationRecord
end

class Customer < ApplicationRecord
end

class Geocode < ApplicationRecord
end

class Product < ApplicationRecord
end

class Receipt < ApplicationRecord
end

class Store < ApplicationRecord
end

def _(v)
  if v.respond_to?(:to_a)
    v = v.to_a
  end
  if v.respond_to?(:first) && v.first.respond_to?(:attributes)
    v = v.collect(&:attributes)
  end
  tp v
end

if Category.all.empty?
  Pathname("../docker/work/data").glob("*.csv").each do |e|
    records = CSV.read(e, headers: :first_row, header_converters: :symbol).collect(&:to_h)
    model = e.basename(".*").to_s.classify.constantize
    records.each_slice(1000) { |e| model.insert_all!(e) }
  end
end

if $0 == __FILE__
  tp ApplicationRecord.subclasses.collect { |e| { name: e.name, count: e.count } }
end

T = 3
N = 10

ActiveRecord::Base.logger = ActiveSupport::Logger.new(STDOUT)
# >> |----------+--------|
# >> | name     | count  |
# >> |----------+--------|
# >> | Store    |     53 |
# >> | Receipt  | 104681 |
# >> | Product  |  10030 |
# >> | Geocode  | 127252 |
# >> | Customer |  21971 |
# >> | Category |    228 |
# >> |----------+--------|
