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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170106100512) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendees", force: :cascade, comment: "ラウンジ参加者" do |t|
    t.string   "uuid",                           null: false, comment: "UUID"
    t.integer  "lounge_id",                      null: false, comment: "ラウンジID"
    t.text     "name",                                        comment: "表示名"
    t.text     "url",                                         comment: "リンク先"
    t.string   "image_file_name",                             comment: "画像ファイル名"
    t.string   "image_content_type",                          comment: "画像MIMEタイプ"
    t.integer  "image_file_size",                             comment: "画像ファイルサイズ"
    t.datetime "image_updated_at",                            comment: "画像更新日時"
    t.integer  "level",              default: 0, null: false, comment: "レベル"
    t.integer  "status",             default: 1, null: false, comment: "状態(-1:スパイ 0:オフ 1:オン)"
    t.string   "remote_ip",                                   comment: "IPアドレス"
    t.text     "user_agent",                                  comment: "UserAgent"
    t.text     "ext1",                                        comment: "拡張データ1"
    t.text     "ext2",                                        comment: "拡張データ2"
    t.text     "ext3",                                        comment: "拡張データ3"
    t.datetime "created_at",                     null: false, comment: "作成日時"
    t.datetime "updated_at",                     null: false, comment: "更新日時"
    t.index ["lounge_id"], name: "index_attendees_on_lounge_id", using: :btree
    t.index ["uuid"], name: "index_attendees_on_uuid", unique: true, using: :btree
  end

  create_table "channel_attendees", force: :cascade, comment: "チャンネル参加者" do |t|
    t.string   "uuid",        null: false, comment: "UUID"
    t.integer  "channel_id",  null: false, comment: "チャンネルID"
    t.integer  "attendee_id", null: false, comment: "参加者ID"
    t.datetime "created_at",  null: false, comment: "作成日時"
    t.index ["attendee_id"], name: "index_channel_attendees_on_attendee_id", using: :btree
    t.index ["channel_id"], name: "index_channel_attendees_on_channel_id", using: :btree
    t.index ["uuid"], name: "index_channel_attendees_on_uuid", unique: true, using: :btree
  end

  create_table "channels", force: :cascade, comment: "チャンネル" do |t|
    t.string   "uuid",               null: false, comment: "UUID"
    t.integer  "lounge_id",          null: false, comment: "ラウンジID"
    t.string   "name",                            comment: "名称"
    t.text     "description",                     comment: "説明"
    t.string   "image_file_name",                 comment: "画像ファイル名"
    t.string   "image_content_type",              comment: "画像MIMEタイプ"
    t.integer  "image_file_size",                 comment: "画像ファイルサイズ"
    t.datetime "image_updated_at",                comment: "画像更新日時"
    t.datetime "created_at",         null: false, comment: "作成日時"
    t.datetime "updated_at",         null: false, comment: "更新日時"
    t.index ["created_at"], name: "index_channels_on_created_at", using: :btree
    t.index ["lounge_id", "name"], name: "index_channels_on_lounge_id_and_name", unique: true, using: :btree
    t.index ["uuid"], name: "index_channels_on_uuid", unique: true, using: :btree
  end

  create_table "lounges", force: :cascade, comment: "ラウンジ" do |t|
    t.string   "uuid",               null: false, comment: "UUID"
    t.string   "name",                            comment: "名称"
    t.text     "description",                     comment: "説明"
    t.string   "image_file_name",                 comment: "画像ファイル名"
    t.string   "image_content_type",              comment: "画像MIMEタイプ"
    t.integer  "image_file_size",                 comment: "画像ファイルサイズ"
    t.datetime "image_updated_at",                comment: "画像更新日時"
    t.datetime "created_at",         null: false, comment: "作成日時"
    t.datetime "updated_at",         null: false, comment: "更新日時"
    t.index ["created_at"], name: "index_lounges_on_created_at", using: :btree
    t.index ["uuid"], name: "index_lounges_on_uuid", unique: true, using: :btree
  end

  create_table "message_attendees", force: :cascade, comment: "メッセージ既読" do |t|
    t.integer  "message_id",  null: false, comment: "メッセージID"
    t.integer  "attendee_id", null: false, comment: "参加者ID"
    t.datetime "created_at",  null: false, comment: "作成日時"
    t.index ["attendee_id"], name: "index_message_attendees_on_attendee_id", using: :btree
    t.index ["message_id"], name: "index_message_attendees_on_message_id", using: :btree
  end

  create_table "messages", force: :cascade, comment: "メッセージ" do |t|
    t.string   "uuid",                null: false, comment: "UUID"
    t.integer  "channel_id",          null: false, comment: "チャンネルID"
    t.integer  "channel_attendee_id", null: false, comment: "チャンネル参加者ID"
    t.text     "body",                             comment: "内容"
    t.datetime "created_at",          null: false, comment: "作成日時"
    t.datetime "updated_at",          null: false, comment: "更新日時"
    t.datetime "deleted_at",          null: false, comment: "削除日時"
    t.datetime "edited_at",           null: false, comment: "変更日時"
    t.index ["channel_attendee_id"], name: "index_messages_on_channel_attendee_id", using: :btree
    t.index ["channel_id"], name: "index_messages_on_channel_id", using: :btree
    t.index ["uuid"], name: "index_messages_on_uuid", unique: true, using: :btree
  end

  create_table "oauth_access_grants", force: :cascade, comment: "OAuthアクセスグラント" do |t|
    t.integer  "resource_owner_id", null: false, comment: "リソース所有者ID"
    t.integer  "application_id",    null: false, comment: "アプリケーションID"
    t.string   "token",             null: false, comment: "アクセストークン"
    t.integer  "expires_in",        null: false, comment: "有効期限"
    t.text     "redirect_uri",      null: false, comment: "コールバックURL"
    t.datetime "created_at",        null: false, comment: "作成日時"
    t.datetime "revoked_at",                     comment: "無効化日時"
    t.string   "scopes",                         comment: "スコープ"
    t.index ["token"], name: "index_oauth_access_grants_on_token", unique: true, using: :btree
  end

  create_table "oauth_access_tokens", force: :cascade, comment: "OAuthアクセストークン" do |t|
    t.integer  "resource_owner_id",              comment: "リソース所有者ID"
    t.integer  "application_id",                 comment: "アプリケーションID"
    t.string   "token",             null: false, comment: "アクセストークン"
    t.string   "refresh_token",                  comment: "リフレッシュトークン"
    t.integer  "expires_in",                     comment: "有効期限"
    t.datetime "revoked_at",                     comment: "無効化日時"
    t.datetime "created_at",        null: false, comment: "作成日時"
    t.string   "scopes",                         comment: "スコープ"
    t.index ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true, using: :btree
    t.index ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id", using: :btree
    t.index ["token"], name: "index_oauth_access_tokens_on_token", unique: true, using: :btree
  end

  create_table "oauth_applications", force: :cascade, comment: "OAuthアプリケーション" do |t|
    t.string   "name",                      null: false, comment: "名称"
    t.string   "uid",                       null: false, comment: "アプリケーションID"
    t.string   "secret",                    null: false, comment: "シークレット"
    t.text     "redirect_uri",              null: false, comment: "コールバックURL"
    t.string   "scopes",       default: "", null: false, comment: "スコープ"
    t.datetime "created_at",                null: false, comment: "作成日時"
    t.datetime "updated_at",                null: false, comment: "更新日時"
    t.index ["uid"], name: "index_oauth_applications_on_uid", unique: true, using: :btree
  end

  create_table "roles", force: :cascade, comment: "ロールマスタ" do |t|
    t.string   "code",                     null: false, comment: "コード"
    t.string   "name",        default: "", null: false, comment: "名称"
    t.text     "policy",      default: "", null: false, comment: "ポリシー"
    t.text     "description", default: "", null: false, comment: "説明"
    t.integer  "sort",                                  comment: "並び順"
    t.datetime "created_at",               null: false, comment: "作成日時"
    t.datetime "updated_at",               null: false, comment: "更新日時"
    t.index ["code"], name: "index_roles_on_code", unique: true, using: :btree
    t.index ["created_at"], name: "index_roles_on_created_at", using: :btree
    t.index ["updated_at"], name: "index_roles_on_updated_at", using: :btree
  end

  create_table "sessions", force: :cascade, comment: "セッションデータ" do |t|
    t.string   "session_id", null: false, comment: "セッションID"
    t.text     "data",                    comment: "データ"
    t.datetime "created_at", null: false, comment: "作成日時"
    t.datetime "updated_at", null: false, comment: "更新日時"
    t.index ["created_at"], name: "index_sessions_on_created_at", using: :btree
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
    t.index ["updated_at"], name: "index_sessions_on_updated_at", using: :btree
  end

  create_table "users", force: :cascade, comment: "ユーザーマスタ" do |t|
    t.string   "nick_name",              default: "", null: false, comment: "ニックネーム"
    t.string   "email",                  default: "", null: false, comment: "メールアドレス"
    t.string   "encrypted_password",     default: "", null: false, comment: "パスワード(ハッシュ値)"
    t.string   "reset_password_token",                             comment: "パスワードリセットトークン"
    t.datetime "reset_password_sent_at",                           comment: "パスワードリセット要求日時"
    t.datetime "remember_created_at",                              comment: "次回自動指定でのログイン日時"
    t.integer  "sign_in_count",          default: 0,  null: false, comment: "ログイン回数"
    t.datetime "current_sign_in_at",                               comment: "今回ログイン日時"
    t.datetime "last_sign_in_at",                                  comment: "前回ログイン日時"
    t.string   "current_sign_in_ip",                               comment: "今回アクセス元IP"
    t.string   "last_sign_in_ip",                                  comment: "前回アクセス元IP"
    t.string   "confirmation_token",                               comment: "登録確認トークン"
    t.datetime "confirmed_at",                                     comment: "登録確認済み日時"
    t.datetime "confirmation_sent_at",                             comment: "登録確認要求日時"
    t.string   "unconfirmed_email",                                comment: "未確認メールアドレス"
    t.integer  "failed_attempts",        default: 0,  null: false, comment: "認証失敗回数"
    t.string   "unlock_token",                                     comment: "アカウントロック解除トークン"
    t.datetime "locked_at",                                        comment: "アカウントロック日時"
    t.string   "image_file_name",                                  comment: "画像ファイル名"
    t.string   "image_content_type",                               comment: "画像MIMEタイプ"
    t.integer  "image_file_size",                                  comment: "画像ファイルサイズ"
    t.datetime "image_updated_at",                                 comment: "画像更新日時"
    t.text     "bio",                                              comment: "自己紹介"
    t.text     "note",                                             comment: "メモ"
    t.datetime "created_at",                          null: false, comment: "作成日時"
    t.datetime "updated_at",                          null: false, comment: "更新日時"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["created_at"], name: "index_users_on_created_at", using: :btree
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree
    t.index ["updated_at"], name: "index_users_on_updated_at", using: :btree
  end

  create_table "users_roles", force: :cascade, comment: "ユーザー：ロール" do |t|
    t.integer "user_id", null: false, comment: "ユーザーID"
    t.integer "role_id", null: false, comment: "ロールID"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", unique: true, using: :btree
  end

  add_foreign_key "attendees", "lounges"
  add_foreign_key "channel_attendees", "attendees"
  add_foreign_key "channel_attendees", "channels"
  add_foreign_key "channels", "lounges"
  add_foreign_key "message_attendees", "attendees"
  add_foreign_key "message_attendees", "messages"
  add_foreign_key "messages", "channel_attendees"
  add_foreign_key "messages", "channels"
  add_foreign_key "users_roles", "roles"
  add_foreign_key "users_roles", "users"
end
