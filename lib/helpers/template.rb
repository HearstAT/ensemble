# frozen_string_literal: true

require 'erb'

module Template
  def self.write(template, output)
    erb = File.read(Dir.pwd + '/templates/' + template)
    File.open(output, 'w+') do |file|
      file.write(ERB.new(erb, nil, '-').result)
    end
  end
end
