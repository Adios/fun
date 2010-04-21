class String
  def vintage
    self.split('.').insert(-2, 'v').join('.')
  end
end

class VintagesController < ApplicationController
  def index
    redirect_to new_vintage_path
  end

  def new
    @photo = VintagePhoto.new
  end

  def create
    @photo = VintagePhoto.new(params[:photo])

    respond_to do |format|
      if @photo.save
        @dimension = Paperclip::Geometry.from_file(@photo.image.path(:small))

        ArtFilter::Vintage.vintager @photo.image.path, @photo.image.path.vintage,
                                    { :cyan => @photo.cyan, :magenta => @photo.magenta, :yellow => @photo.yellow }
        ArtFilter::Vintage.vintager @photo.image.path(:small), @photo.image.path(:small).vintage,
                                    { :cyan => @photo.cyan, :magenta => @photo.magenta, :yellow => @photo.yellow }

        format.html { render :file => 'vintages/success.html.erb' }
      else
        format.html { render :file => 'vintages/fail.html.erb' }
      end
    end
  end

  def show
    photo = get_image
    send_file photo.image.path.vintage, :type => photo.image.content_type
  end

  def thumbnail
    photo = get_image
    send_file photo.image.path(:small).vintage, :type => photo.image.content_type, :disposition => 'inline'
  end

  def original
    photo = get_image
    send_file photo.image.path(:small), :type => photo.image.content_type, :disposition => 'inline'
  end

  private

  def get_image
    VintagePhoto.find_by_image_file_name!(params[:id])
  end
end
