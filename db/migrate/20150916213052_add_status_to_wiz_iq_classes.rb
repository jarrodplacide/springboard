class AddStatusToWizIqClasses < ActiveRecord::Migration
  def change
    add_column :wiz_iq_classes, :status, :integer, default: 0
  end
end
