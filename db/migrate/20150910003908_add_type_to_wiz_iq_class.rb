class AddTypeToWizIqClass < ActiveRecord::Migration
  def change
    add_column :wiz_iq_classes, :type, :string
  end
end
