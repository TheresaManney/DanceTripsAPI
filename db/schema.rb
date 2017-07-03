ActiveRecord::Schema.define(version: 20170703194616) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "competitions", force: :cascade do |t|
    t.string   "level"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "type"
    t.boolean  "finals",     default: false
    t.integer  "placement"
  end

  create_table "details", force: :cascade do |t|
    t.string   "thoughts"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "travelers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trips", force: :cascade do |t|
    t.string   "location"
    t.datetime "dates"
    t.boolean  "event_paid"
    t.boolean  "hotel_reserved"
    t.boolean  "flight_paid"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

end
