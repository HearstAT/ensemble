# frozen_string_literal: true

require_relative '../../lib/helpers/os'
require_relative '../../lib/helpers/process'

desc 'Stop ensemble regardless of startup type'
task stop: :environment do
  if OS.linux?
    Process.linux_shutdown
  elsif OS.posix?
    Process.posix_shutdown
  else
    Process.windows_shutdown
  end
end
