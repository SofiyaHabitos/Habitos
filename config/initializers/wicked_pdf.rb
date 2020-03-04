# WickedPDF Global Configuration
#
#Mime::Type.register "application/pdf", :pdf
# Use this to set up shared configuration options for your entire application.
# Any of the configuration options shown here can also be applied to single
# models by passing arguments to the `render :pdf` call.
#
# To learn more, check out the README:
#
# https://github.com/mileszs/wicked_pdf/blob/master/README.md

WickedPdf.config = {
  # Path to the wkhtmltopdf executable: This usually isn't needed if using
  # one of the wkhtmltopdf-binary family of gems.
  # :exe_path => Rails.root.join('public', 'uploads').to_s,
  #   or
  # exe_path: Gem.bin_path('wkhtmltopdf-binary', 'wkhtmltopdf')

  # Layout file to be used for all PDFs
  # (but can be overridden in `render :pdf` calls)
  # layout: 'pdf.html',
}


# WickedPdf.config = {
# :wkhtmltopdf => Rails.root.join('public', 'uploads', 'pdf', 'wkhtmltopdf-i386').to_s,
# :layout => "tenants/_dynamic_client_menu.html.erb",
# :margin => { :top=> 40,
# :bottom => 20,
# :left=> 30,
# :right => 30}
# #:header => {:html => { :template=> 'layouts/pdf_header.html'}},
# #:footer => {:html => { :template=> 'layouts/pdf_footer.html'}}
# #:exe_path => "C:/Sites/Fedena/pdf/wkhtmltopdf.exe"
# }



