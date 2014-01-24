class RemoveConnectionAddressAndProtocolFromProjects < ActiveRecord::Migration
  def change
  	remove_column :projects, :protocol
  	remove_column :projects, :connection_address
  end
end
