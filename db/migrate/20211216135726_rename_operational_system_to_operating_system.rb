class RenameOperationalSystemToOperatingSystem < ActiveRecord::Migration[6.0]
  def change
    rename_column :system_requirements, :operational_system, :operating_system
  end
end
