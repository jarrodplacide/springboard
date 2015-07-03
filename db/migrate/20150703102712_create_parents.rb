class CreateParents < ActiveRecord::Migration
  def change
    create_table :parents do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :contact_no
      t.string :street_address_1
      t.string :street_address_2
      t.string :city
      t.string :country

      t.timestamps null: false
    end
  end
end
