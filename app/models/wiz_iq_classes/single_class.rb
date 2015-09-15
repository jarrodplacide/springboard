# == Schema Information
# Schema version: 20150910003908
#
# Table name: wiz_iq_classes
#
#  id                  :integer          not null, primary key
#  wiziqclass_id       :integer
#  instructor_id       :integer
#  instructor_url      :string
#  administrator_url   :string
#  name                :string
#  start_time          :datetime
#  duration            :integer
#  recording_requested :boolean
#  recording_url       :string
#  section_id          :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  type                :string
#
# Indexes
#
#  index_wiz_iq_classes_on_instructor_id  (instructor_id)
#  index_wiz_iq_classes_on_section_id     (section_id)
#  index_wiz_iq_classes_on_wiziqclass_id  (wiziqclass_id) UNIQUE
#

class SingleClass < WizIqClass
  # Scopes
  #scope :upcoming, -> {where(start_time > DateTime.now)}
  # TODO Change to Class Status to Differentiate between Past & Current
  #scope :past, -> {where(start_time < DateTime.now)}

  # Belongs to a Section
  belongs_to :section, inverse_of: :wiz_iq_classes_single_classes

  # Custom Setters
  def wiziqdetails(attributes)
    self.wiziqclass_id = attributes[:class_details][:class_id]
    self.instructor_url = attributes[:class_details][:presenter_list][:presenter][:presenter_url]
    self.administrator_url = attributes[:class_details][:presenter_list][:presenter][:co_presenter_url]
    self.recording_url = attributes[:class_details][:recording_url]
  end
end
