task :mail => :environment do
HistoryNotifierMailer.history.deliver_now
end
