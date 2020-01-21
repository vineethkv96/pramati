require 'rmagick'
include Magick

puts Magick::Version

tiff = ImageList.new("file_TIFF.tiff")
tiff.write("file_conv_png.png")
exit