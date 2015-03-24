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

    def install_rspec
      run 'bundle exec rails g rspec:install'
    end

    def remove_rspec_warning
      replace_in_file(
        '.rspec',
        /--warnings/m,
        '#--warnings'
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
