class PaymentMailer < ApplicationMailer
	def success_email(details, payment)
    @name = details.client_name
    @amount = details.total_amount
    @plan_name = details.plan_name
    invoice_pdf = PaymentInvoicePdf.new(details, payment, view_context) 
    attachments['INVOICE.pdf'] = {
                                  mime_type: 'application/pdf',
                                  content: invoice_pdf.render
                                  }
    mail(to: details.email, subject: 'Payment Notifier')
  end
end
