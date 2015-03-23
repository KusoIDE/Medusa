require 'tempfile'

module Concerns::Package::Fields

  extend ActiveSupport::Concern

  included do
    before_save :upload_file
  end

  def upload_file
    file_data = extract_data(package)
    filename, ext = process_name(package[:filename])

    write_fil_data(filename, ext, file_data) do |file|

      file_size = File.size(orig)
      # TODO: Validate the size
      # TODO: Validate the content type
      write_attributes(field, filename, data[:content_type], file_size)

      Rails.logger.info "PATH: #{filename} - #{data[:content_type]} - #{file_size}"
      Rails.logger.info "Buffer size: #{file_data.size}"
    end
    true
  end

  private

  def process_name(name)
    random_name = SecureRandom.hex(32)

    original_filename = File.basename(name, '.*')
    ext = File.extname(name)
    filename = "#{original_filename}_#{random_name}#{ext}"

    [filename, ext]
  end

  def write_attributes(field, filename, content_type, file_size)
    write_attribute("#{field}_file_name", filename)
    # TODO: Check for correct content_type
    write_attribute("#{field}_content_type", content_type)
    write_attribute("#{field}_file_size", file_size)
    write_attribute("#{field}_updated_at", Time.now)
  end

  def write_file_data(file_name, extname, file_data)

    file = Tempfile.new([file_name, extname])
    file.binmode
    file.write(file_data)
    yield file

  rescue Exception => e
    Rails.logger.error "ERROR Uploading file: #{e.to_s}"
    raise

  ensure
    file.close
    file.unlink
  end

  def extract_data(package)
    if package[:data].present?
      base64_part = package[:data].split(',')[-1]
      decoded_data = Base64.strict_decode64(base64_part)
      #data = StringIO.new(decoded_data)
      return decoded_data
    end
    nil
  end


  def upload_file
  end
end
