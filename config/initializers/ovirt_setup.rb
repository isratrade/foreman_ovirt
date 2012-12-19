# Add permissions
Foreman::AccessControl.map do |map|
   map.security_block :ovirt do |map|
        map.permission :view_ovirt, { 'foreman_ovirt/hosts' => [:show] }
   end
end

# Add a new role called 'Ovirt' if it doesn't exist
Role.transaction do
  ovirt_role = Role.find_or_create_by_name("Ovirt")
  if ovirt_role.permissions.empty?
    ovirt_role.update_attribute :permissions, [:view_ovirt]
  end
end

