require 'nokogiri'
require 'open-uri'
require 'combine_pdf'

class ReexaminationCertificate

  def initialize(pat_num)
    @patnum = pat_num
    @doc = Nokogiri::HTML(open("http://pdfpiw.uspto.gov/.piw?docid=#{@patnum}&PageNum=0"))
  end

  def reexamination_check
    @doc.css('a font b').text.include? 'Reexamination'
  end

  def patent_doc_download
    pdf_url = 'https:' + @doc.css('embed')[0].attribute('src').value
    pdf_file = open(pdf_url)
    File.open("#{@patnum}.pdf", 'wb') do |file| 
      file.write(pdf_file.read())
    end
  end

  def pdf_creation(pdf, start_no, end_no)
    new_pdf = CombinePDF.new
    pdf.pages[(start_no-1)..end_no].each{ |page|
      new_pdf << page
    }
    new_pdf
  end

  def get_reexam_pdf
    reexam_page = Nokogiri::HTML(open("http://pdfpiw.uspto.gov/.piw?docid=#{@patnum}&SectionNum=6"))
    reexam_page_no = reexam_page.children[1].text.split('=')[1].strip.to_i
    end_no = reexam_page.children[2].text.split('=')[1].strip.to_i
    pdf = CombinePDF.load("#{@patnum}.pdf")
    reexam_pdf = pdf_creation(pdf, reexam_page_no, end_no)
    reexam_pdf.save("reexam_#{@patnum}.pdf")
  end

  def get_reexamination_certificate
    if reexamination_check
      patent_doc_download
      get_reexam_pdf
      puts "Reexamination certificate downloaded"
    else
      puts "Reexamination certificate not available"
    end
  end

end
# 7397363
obj = ReexaminationCertificate.new(2549731)
obj.get_reexamination_certificate