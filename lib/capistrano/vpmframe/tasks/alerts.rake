namespace :alerts do

  desc 'Slack alert'
  task :slack do
    system("curl -s -X POST --data-urlencode 'payload={\"channel\": \"\##{fetch(:slack)[:channel]}\", \"username\": \"deploybot\", \"text\": \"*#{fetch(:application)}* deployed *#{fetch(:current_revision)}* successfully to *#{fetch(:branch)}* \", \"icon_emoji\": \":tada:\"}' #{fetch(:slack)[:webhook]} > /dev/null")
  end

end
