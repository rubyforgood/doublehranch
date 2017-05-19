# config/initializers/paperclip.rb
# If you want to disable paperclip attachments to S3 in the development environment,
# remove the comments from the "if" condition below and restart the server.
# if Rails.env.staging? || Rails.env.production?
unless true # Rails.env.test?

  Paperclip::Attachment.default_options[:storage] = :s3

  Paperclip::Attachment.default_options[:s3_credentials] = {
      :bucket => "doublehranch-#{Rails.env}",
      :access_key_id => Rails.application.secrets[:aws_access_key_id],
      :secret_access_key => Rails.application.secrets[:aws_secret_access_key]
  }

  Paperclip::Attachment.default_options[:url] = ':s3_domain_url'
  Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'
  # The only addition required to make the code work with DreamHost's DreamObjects..
  # Paperclip::Attachment.default_options[:s3_host_name] = 'objects.dreamhost.com'
  # Paperclip::Attachment.default_options[:s3_protocol] = 'https'
end
