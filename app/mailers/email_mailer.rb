class EmailMailer < ActionMailer::Base
  default from: "from@mailheaders.com",
      :mime_version => "1.0.1"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.email_mailer.send_email.subject
  #
  def send_email(email)
    @greeting = "Hi"
    headers = {
        :to => "guenter@inode.at",
        :subject => email.subject, 
        :body => email.body,
        :mime_version => '2.0'
        }
    
    my_headers = {}
    # headers({'X-No-Spam' => 'True', 'In-Reply-To' => '1234@message.id'})
    email.headerables.each do |headerable|
      headers[headerable.header.name.to_sym] = headerable.value if headerable.header
    end
    
    # my_headers[:mime_version] = '1.0.1'
    
    headers(my_headers) if my_headers

    mail headers 

  end
end
