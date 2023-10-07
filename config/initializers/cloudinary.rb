# Replace the 'config_from_url' string value below with your
# product environment's credentials, available from your Cloudinary console.
# =====================================================

require 'cloudinary'

Cloudinary.config_from_url("cloudinary://912457955913322:uzKd9KoK8QpPBhe8f1LhV7pe45A@dhbgg1jnf")
Cloudinary.config do |config|
  config.secure = true
end