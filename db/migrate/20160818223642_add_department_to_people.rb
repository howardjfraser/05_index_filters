class AddDepartmentToPeople < ActiveRecord::Migration[5.0]
  def change
    add_column :people, :department, :string
  end
end
