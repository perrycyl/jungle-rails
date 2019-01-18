class ApplicationMailer < ActionMailer::Base
  default from: "order@jungle.com"
  layout 'mailer'
end

# class Notifier < ApplicationMailer
#   default from: 'order@jungle.com',
#           return_path: 'system@example.com'

#   def order(recipient)
#     @account = recipient
#     mail(to: recipient.email_address_with_name)
          
#   end
# end

