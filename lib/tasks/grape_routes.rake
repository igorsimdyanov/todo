namespace :grape do
  desc 'Condensed API Routes'
  task routes: :environment do
    format_str = '%46s  %3s %7s %50s %12s:  %s'
    RootApi.routes.each do |grape_route|
      info = grape_route.instance_variable_get :@options
      puts format(format_str,
                  info[:description] ? info[:description][0..45] : '',
                  info[:version],
                  info[:method],
                  "/#{info[:prefix]}/#{info[:version]}#{info[:namespace]}#{info[:path]}",
                  "# params: #{info[:params].length}",
                  info[:params].first)
    end
  end
end
