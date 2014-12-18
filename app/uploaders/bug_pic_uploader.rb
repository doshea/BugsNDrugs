class BugPicUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick

  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  # include Sprockets::Helpers::RailsHelper
  # include Sprockets::Helpers::IsolatedHelper
  include Sprockets::Rails::Helper

  # Choose what kind of storage to use for this uploader:
  storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  #TODO Change these to more relevant sizes
  version :large_unaltered do
    process :resize_to_fit => [500, 500]
  end

  version :preview do
    process :resize_to_fit => [300,1000]
  end

  version :preview_fill do
    process :resize_to_fill => [300, 300]
  end

  version :small_altered do
    process :resize_to_fill => [50, 50]
  end

  version :thumb, from_version: :small_altered do
    process :resize_to_fill => [27, 27]
  end

end
