class VintagePhoto < ActiveRecord::Base
  has_attached_file :image,
                    :path => ':rails_root/tmp/uploads/:id_partition/:basename_:style.:extension',
                    :styles => { :small => '300x300' }

  before_create :randomize_file_name

  validates_attachment_presence :image
  validates_attachment_content_type :image, :content_type => %w(image/png image/jpeg image/x-png image/pjpeg)
  validates_attachment_size :image, :less_than => 8.megabytes
  validates_presence_of :cyan, :magenta, :yellow
  validates_inclusion_of :cyan, :in => 0..100
  validates_inclusion_of :magenta, :in => 0..100
  validates_inclusion_of :yellow, :in => 0..100

  private

  def randomize_file_name
    extension = File.extname(image_file_name).downcase
    self.image.instance_write(:file_name, "#{ActiveSupport::SecureRandom.hex(16)}#{extension}")
  end
end
