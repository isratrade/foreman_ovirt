module ForemanOvirt
  module DefaultData
    class DataAlreadyLoaded < Exception; end
    module Loader
      class << self
        def load(reset=false)
          Role.transaction do
            ovirt_role = Role.where(:name => "Ovirt").empty? ? Role.create(:name => "Ovirt") : Role.where(:name => "Ovirt")[0]
            if reset || ovirt_role.permissions.empty?
              ovirt_role.update_attribute :permissions, [:view_ovirt]
            end
          end
          true
        end
      end
    end
  end
end
# Add a new role called 'Ovirt' if it doesn't exist
ForemanOvirt::DefaultData::Loader.load(false)
# Add permissions for role Ovirt
Foreman::AccessControl.send :include, ForemanOvirt::AccessControlExtensions
# Add Ovirt role to ovirt user
User.send :include, ForemanOvirt::UserExtensions
