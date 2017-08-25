
# frozen_string_literal: true

module Process
  def self.systemd?
    if OS.linux?
      check = system('pidof systemd && echo "systemd" || echo "other"')
      check == 'other' ? false : true
    else
      false
    end
  end

  def self.upstart?
    if OS.linux?
      check = system('/sbin/init --version')
      check == 'upstart' ? false : true
    else
      false
    end
  end

  def self.compose?
    check = system('docker-compose ps | grep ensemble') if File.file?('docker-compose')
    check.blank? ? false : true
  end

  def self.linux_shutdown
    if systemd?
      system('systemctl stop ensemble')
    elsif upstart?
      system('stop ensemble')
    elsif compose?
      system('docker-compose stop')
    else
      system('kill -9 $(cat ./tmp/pids/server.pid)')
    end
  end

  def self.posix_shutdown
    if compose?
      system('docker-compose stop')
    else
      system('kill -9 $(cat ./tmp/pids/server.pid)')
    end
  end

  def self.windows_shutdown
    if compose?
      system('docker-compose stop')
    else
      pid = system('type tmp/pids/server.pid)')
      system("Taskkill /PID #{pid} /F")
    end
  end
end
