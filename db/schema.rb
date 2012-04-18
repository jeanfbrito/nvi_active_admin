# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120418144442) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "carts", :force => true do |t|
    t.integer  "user_id"
    t.boolean  "completed",  :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "carts", ["completed"], :name => "index_carts_on_completed"
  add_index "carts", ["user_id"], :name => "index_carts_on_user_id"

  create_table "instructors", :force => true do |t|
    t.string   "name"
    t.text     "bio"
    t.string   "profile_picture_uid"
    t.string   "profile_picture_name"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "line_items", :force => true do |t|
    t.integer  "purchasable_id"
    t.string   "purchasable_type"
    t.integer  "cart_id"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.integer  "price_in_pennies", :default => 0
  end

  add_index "line_items", ["cart_id"], :name => "index_line_items_on_cart_id"
  add_index "line_items", ["purchasable_id"], :name => "index_line_items_on_purchasable_id"

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "market_sectors", :force => true do |t|
    t.string   "name"
    t.text     "blurb"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "slug"
    t.string   "subheading"
  end

  add_index "market_sectors", ["slug"], :name => "index_market_sectors_on_slug"

  create_table "online_courses", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "price_in_pennies"
    t.integer  "position"
    t.integer  "market_sector_id"
    t.integer  "instructor_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "online_courses", ["instructor_id"], :name => "index_online_courses_on_instructor_id"
  add_index "online_courses", ["market_sector_id"], :name => "index_online_courses_on_market_sector_id"
  add_index "online_courses", ["position"], :name => "index_online_courses_on_position"

  create_table "online_lessons", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "price_in_pennies", :default => 0
    t.string   "video_uid"
    t.integer  "online_course_id"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.integer  "position"
  end

  add_index "online_lessons", ["online_course_id"], :name => "index_online_lessons_on_online_course_id"
  add_index "online_lessons", ["position"], :name => "index_online_lessons_on_position"

  create_table "onsite_course_locations", :force => true do |t|
    t.integer  "onsite_course_id"
    t.integer  "location_id"
    t.integer  "instructor_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "onsite_course_locations", ["instructor_id"], :name => "index_onsite_course_locations_on_instructor_id"
  add_index "onsite_course_locations", ["location_id"], :name => "index_onsite_course_locations_on_location_id"
  add_index "onsite_course_locations", ["onsite_course_id"], :name => "index_onsite_course_locations_on_onsite_course_id"

  create_table "onsite_courses", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "price_in_pennies"
    t.integer  "down_payment_price_in_pennies", :default => 200000
    t.integer  "position"
    t.integer  "market_sector_id"
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
  end

  add_index "onsite_courses", ["market_sector_id"], :name => "index_onsite_courses_on_market_sector_id"
  add_index "onsite_courses", ["position"], :name => "index_onsite_courses_on_position"

  create_table "onsite_lesson_locations", :force => true do |t|
    t.integer  "onsite_lesson_id"
    t.integer  "location_id"
    t.integer  "seats_remaining"
    t.time     "start_time"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "onsite_lesson_locations", ["location_id"], :name => "index_onsite_lesson_locations_on_location_id"
  add_index "onsite_lesson_locations", ["onsite_lesson_id"], :name => "index_onsite_lesson_locations_on_onsite_lesson_id"

  create_table "onsite_lessons", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "price_in_pennies"
    t.integer  "down_payment_price_in_pennies", :default => 200000
    t.integer  "onsite_course_id"
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
    t.integer  "position"
  end

  add_index "onsite_lessons", ["onsite_course_id"], :name => "index_onsite_lessons_on_onsite_course_id"
  add_index "onsite_lessons", ["position"], :name => "index_onsite_lessons_on_position"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "zip_code"
    t.string   "phone_number"
    t.string   "stripe_customer_id"
  end

end
