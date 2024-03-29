# == Schema Information
# Schema version: 20150819134339
#
# Table name: instructors
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime
#  updated_at             :datetime
#  first_name             :string
#  last_name              :string
#  middle_initial         :string
#  contact_no             :string
#  locked_at              :datetime
#  unlock_token           :string
#  failed_attempts        :integer
#
# Indexes
#
#  index_instructors_on_email                 (email) UNIQUE
#  index_instructors_on_reset_password_token  (reset_password_token) UNIQUE
#  index_instructors_on_unlock_token          (unlock_token) UNIQUE
#

class Instructor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable

  # Can be associated with many sections
  has_many :sections, inverse_of: :instructor

  # Creates many topic threads
  has_many :topic_threads, inverse_of: :instructor

  # Creates many thread posts
  has_many :thread_posts, inverse_of: :instructor

  # Has many Classes
  has_many :wiz_iq_classes, inverse_of: :instructor

  # Has many upcoming classes
  has_many :upcoming_classes, -> { where("start_time > ?", DateTime.now).order('start_time ASC') }, class_name: 'SingleClass'

  # Has many past classes
  has_many :past_classes, -> { where("start_time < ?", DateTime.now).order('start_time DESC') }, class_name: 'SingleClass'

  # Convenience Methods
  def name
    first_name + ' ' + middle_initial + ' ' + last_name
  end
end
