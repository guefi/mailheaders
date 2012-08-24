class AddingDefaultentriesToHeaders < ActiveRecord::Migration
  def change
    
    Header.create!(:name => 'mime_version', :default_value => '1.0')
    Header.create!(:name => 'charset', :default_value => 'UTF-8')
    Header.create!(:name => 'content_type', :default_value => 'text/plain')
    Header.create!(:name => 'X-No-Spam', :default_value => 'True')
    Header.create!(:name => 'In-Reply-To', :default_value => '1234@message.id')
    Header.create!(:name => 'from', :default_value => 'guenter.fiala@inode.at')
    Header.create!(:name => 'to', :default_value => '<client email>')
    Header.create!(:name => 'message-id', :default_value => '')
    Header.create!(:name => 'Date', :default_value => '')

  end
end
