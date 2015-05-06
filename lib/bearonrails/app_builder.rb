#
module Bearonrails
  #
  class AppBuilder < Rails::AppBuilder
    def add_common_rake_tasks
      directory 'tasks', 'lib/tasks'
    end

    def init_git
      run 'git init'
    end

    def add_custom_gems
      additions_path = find_in_source_paths 'Gemfile_additions'
      new_gems = File.open(additions_path).read
      inject_into_file(
        'Gemfile',
        "\n#{new_gems}",
        after: /^end/
      )
    end

    def add_rubocop_config
      copy_file '.rubocop.yml', '.rubocop.yml'
    end

    def add_new_relic_config
      copy_file 'config/newrelic.yml', 'config/newrelic.yml'

      replace_in_file(
        '.env',
        /change-this-to-your-app-name/m,
        "#{app_name}"
      )
    end

    def add_dot_env
      copy_file '.env', '.env'

      inject_into_file(
        'config/application.rb',
        "Dotenv.load\n\n",
        before: /^module/
      )
    end

    def install_rspec
      run 'bundle exec rails g rspec:install'
    end

    def add_rspec_helper_addon
      additions_path = find_in_source_paths 'spec/rails_helper_addon'
      addon_config = File.open(additions_path).read
      inject_into_file(
        'spec/rails_helper.rb',
        "\n#{addon_config}",
        before: /^end/
      )
    end

    def remove_routes_comment_lines
      replace_in_file(
        'config/routes.rb',
        /Rails\.application\.routes\.draw do.*end/m,
        "Rails.application.routes.draw do\nend"
      )
    end

    private

    def replace_in_file(relative_path, find, replace)
      path = File.join(destination_root, relative_path)
      contents = IO.read(path)
      unless contents.gsub!(find, replace)
        fail "#{find.inspect} not found in #{relative_path}"
      end
      File.open(path, 'w') { |file| file.write(contents) }
    end
  end
end
