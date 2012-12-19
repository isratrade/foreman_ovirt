module ForemanOvirt
	 module UserExtensions
		extend ActiveSupport::Concern

	 	included do
	 		after_save :add_role_to_user
		end

		module InstanceMethods
    		def add_role_to_user
    			#if auth_source is ovirt
    			puts "add_role_to_user"
    		end
		end

   end
end
