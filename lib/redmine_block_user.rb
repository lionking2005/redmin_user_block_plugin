Rails.configuration.to_prepare do
	unless AccountController.included_modules.include?(RedmineUserBlock::Patches::AccountControllerPatch)
      AccountController.send(:include, RedmineUserBlock::Patches::AccountControllerPatch)
    end
end