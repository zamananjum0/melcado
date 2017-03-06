Spree::Slide.class_eval do

if Rails.env.production?
    has_attached_file :image,
                      storage: :s3,
                      s3_credentials: {
                        bucket: ENV['S3_BUCKET_NAME'],
                        access_key_id: ENV['AWS_ACCESS_KEY_ID'],
                        secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
                      },
                      url: ":s3_domain_url",
                      path: '/spree/slides/:id/:style/:basename.:extension',
                      convert_options: { all: '-strip -auto-orient -colorspace sRGB' }
  end                    
end
