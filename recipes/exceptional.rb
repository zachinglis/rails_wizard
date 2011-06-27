gem 'exceptional'

if config['use_heroku']
  after_everything do
    say_wizard "Adding exceptional:premium Heroku addon"
    run "heroku addons:add exceptional:premium"
  end
else
  after_bundler do
    run "exceptional install #{config['api_key']}"
  end
end

say_wizard "Do not forget to run 'exceptional test' after the wizard"

__END__

name: Exceptional
description: Add Exceptional reporting to your application.

category: services
exclusive: exception_notification
tags: [exception_notification]

config:
  - use_heroku:
      type: boolean
      prompt: "Use the Exceptional Heroku addon? ($9 a month)"
      if_recipe: heroku
  - api_key:
      prompt: "Enter Exceptional API Key:"
      type: string
      unless: use_heroku
