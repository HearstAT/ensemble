# this tip from: https://gist.github.com/typeoneerror/a5e632f0ee97a8b5987a
class DeviseMailer < Devise::Mailer
  helper :application # gives access to all helpers defined within `application_helper`.
  # include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
  # default template_path: 'confirmation' # to make sure that your mailer uses the devise views

  def confirmation_instructions(record, token, opts = {})
    @token = token

    scope_name = Devise::Mapping.find_scope!(record)
    devise_mapping = Devise.mappings[scope_name]
    template = 'mailer.html.erb'.to_sym

    # set the template path to whereever you want templates to live.
    # defaults to [#{devise_mapping}/mailer, devise/mailer] but in this case
    # all the confirmation templates are in my main engine's mailer directory
    opts = {
      template_path: 'confirmation',
      subject: 'Ensemble email confirmation'
    }.merge(opts)

    devise_mail(record, template, opts)
  end
end
