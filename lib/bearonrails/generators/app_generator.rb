require 'rails/generators'
require 'rails/generators/rails/app/app_generator'

#
module Bearonrails
  #
  class AppGenerator < Rails::Generators::AppGenerator
    def finish_template
      bearonrails_customization
      super
    end

    def bearonrails_customization
      invoke :remove_files_we_dont_need
      invoke :add_common_rake_tasks
      invoke :customize_gemfile
      invoke :install_rspec
      invoke :add_rubocop_config
      invoke :remove_routes_comment_lines
      invoke :init_git
    end

    def remove_files_we_dont_need
      say 'remove files we don\'t need'
      build :remove_public_index
      build :remove_rails_logo_image
    end

    def add_common_rake_tasks
      say 'Add common rake tasks'
      build :add_common_rake_tasks
    end

    def customize_gemfile
      build :add_custom_gems
      bundle_command 'install'
    end

    def add_rubocop_config
      say 'Add rubocop config'
      build :add_rubocop_config
    end

    def install_rspec
      say 'Install rspec'
      build :install_rspec
      build :remove_rspec_warning
    end

    def remove_routes_comment_lines
      say 'Remove routes comment lines'
      build :remove_routes_comment_lines
    end

    def init_git
      say 'Init git'
      build :init_git
    end

    protected

    def get_builder_class
      Bearonrails::AppBuilder
    end
  end
end
