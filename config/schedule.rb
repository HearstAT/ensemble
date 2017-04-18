every :reboot do
  # `bin/delayed_job -n2 start`
  # command 'bin/delayed_job -n2 start'
  # `bundle exec rake gather:pagerduty_incidents`
  # command 'bundle exec rake gather:pagerduty_incidents'
  runner 'PagerDutyJob.create'
end

every :day, at: '6am' do
  # specify the task name as a string
  # rake 'send_digest_email'
  runner 'PagerDutyJob.create'
end

every 1.minute do
  runner 'PagerDutyJob.create'
end
