class EmailMailer < ActionMailer::Base
  default from: "from@mailheaders.com",
      :mime_version => "1.0.1"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.email_mailer.send_email.subject
  #
  
  def get_headers
    @headers = headers
    @headers
  end
  
  def set_headers(options={})
    @headers = options
    headers = @headers
  end
  
  def get_raw
    @raw_source
  end
  
  def send_email(email)
    @greeting = "Hi"
    headers = {
        :subject => email.subject, 
        :body => email.body
        }
    
    my_headers = {}
    # headers({'X-No-Spam' => 'True', 'In-Reply-To' => '1234@message.id'})
    email.headerables.each do |headerable|
      headers[headerable.header.name.to_sym] = headerable.value if headerable.header
    end
    
    # my_headers[:mime_version] = '1.0.1'
    
    headers(my_headers) if my_headers
    
    set_headers headers

    mail headers 
    
    @raw_source

  end
end
