# == Schema Information
# Schema version: 20150703143959
#
# Table name: students
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
#  middle_initial         :string
#  last_name              :string
#  dob                    :date
#  gender                 :string
#  school_id              :integer
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  failed_attempts        :integer
#  unlock_token           :string
#  locked_at              :datetime
#
# Indexes
#
#  index_students_on_confirmation_token    (confirmation_token) UNIQUE
#  index_students_on_email                 (email) UNIQUE
#  index_students_on_reset_password_token  (reset_password_token) UNIQUE
#  index_students_on_unlock_token          (unlock_token) UNIQUE
#

class Student < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable

  # Belongs to School
  belongs_to :school, inverse_of: :students

  # Has at least one parent
  has_many :parents, inverse_of: :student

  # Has 0 or many subscriptions
  has_many :subscriptions, inverse_of: :student

  # Has Many Sections
  has_many :student_sections
  has_many :sections, through: :student_sections

  # Has Many Payments
  has_many :payments, inverse_of: :student

  # Creates Many Topic Threads
  has_many :topic_threads, inverse_of: :student

  # Creates Many Thread Posts
  has_many :thread_posts, inverse_of: :student

  # Convenience Methods
  def name
    first_name + ' ' + middle_initial + ' ' + last_name
  end

end
