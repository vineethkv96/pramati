require 'nokogiri'
require 'open-uri'
require 'combine_pdf'
require 'pry'

pat_num = 7397363

doc = Nokogiri::HTML(open("http://pdfpiw.uspto.gov/.piw?docid=#{pat_num}&PageNum=0"))
pdf_url = 'https:' + doc.css('embed')[0].attribute('src').value

if doc.css('a font b').text.include? 'Reexamination'
  reexam_page = Nokogiri::HTML(open("http://pdfpiw.uspto.gov/.piw?docid=#{pat_num}&SectionNum=6"))

  reexam_page_no = reexam_page.children[1].text.split('=')[1].strip.to_i
  end_no = reexam_page.children[2].text.split('=')[1].strip.to_i

  pdf_file = open(pdf_url)
  File.open("#{pat_num}.pdf", 'wb') do |file| 
    file.write(pdf_file.read())
  end
  pdf = CombinePDF.load("#{pat_num}.pdf")
  reexam_pdf = CombinePDF.new
  pdf.pages[(reexam_page_no-1)..end_no].each{ |page|
    reexam_pdf << page
  }
  reexam_pdf.save("reexam_#{pat_num}.pdf")
else
  puts "Reexamination certificate not available"
end

exit