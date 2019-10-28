module RedmineUserBlock
	module Patches
		module AccountControllerPatch
			def self.included(base)
				base.extend(ClassMethods)
				base.send(:include, InstanceMethods)

				base.class_eval do
					alias_method_chain :invalid_credentials, :buser
				end
			end

			module ClassMethods
    		end
    		
    		module InstanceMethods
    			def invalid_credentials_with_buser
    				user = User.find_by_login(params[:username]);
    				if user.nil?
    					invalid_credentials_without_buser
    					return
    				end
    				current_attemt_cnt = (user[:attemp_login_count].nil?)?0:user[:attemp_login_count]
    				defaults = Redmine::Plugin::registered_plugins[:Redmine_block_user].settings[:default] || {}
    				settings = Setting.plugin_Redmine_block_user || {}
    				@settings = settings.reverse_merge(defaults).with_indifferent_access

    				if @settings[:block_use_yn] == true
    					if current_attemt_cnt >= @settings[:attempt_times].to_i
    						user.update(:attemp_login_count => 0, :status => 3)
    					else
    						user.update(:attemp_login_count => current_attemt_cnt + 1)
    					end
    				end
    				invalid_credentials_without_buser
    			end
    		end
		end
	end
end