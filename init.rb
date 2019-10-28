raise "\n\033[31mredmine_zoho_cliq requires ruby 2.1 or newer. Please update your ruby version.\033[0m" if RUBY_VERSION < '2.1'

require 'redmine'
require 'redmine_block_user'

Redmine::Plugin.register :Redmine_block_user do
  name 'Redmine Block User plugin'
  author 'Andres'
  description 'A redmine plugin to block users after X unsuccessful login attempts.'
  version '1.0.0'

  requires_redmine version_or_higher: '3.0.0'
  
  settings partial: 'settings/block_user_settings',
    default: {
      :block_use_yn => true,
      :attempt_times => "3"
    }
end
