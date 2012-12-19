# Ensure that module is namespaced with plugin name
module ForemanOvirt
	 module AccessControlExtensions
		extend ActiveSupport::Concern

	 	included do
 			self.map do |map|
			  map.security_block :ovirt do |map|
	          	map.permission :view_ovirt, { 'foreman_ovirt/hosts' => [:show] }
			  end
		  	end
		end

   end
end

