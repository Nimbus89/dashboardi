class AddProtocolAndConnectionAddressToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :protocol, :string
    add_column :projects, :connection_address, :string
  end
end
