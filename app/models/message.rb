# == Schema Information
#
# Table name: messages
#
#  id                  :integer          not null, primary key
#  uuid                :string           not null
#  channel_id          :integer          not null
#  channel_attendee_id :integer          not null
#  body                :text
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  deleted_at          :datetime         not null
#  edited_at           :datetime         not null
#

class Message < ApplicationRecord
  extend FriendlyId
  friendly_id :uuid

  belongs_to :channel
  belongs_to :channel_attendee
  has_one :attendee, through: :post

end
