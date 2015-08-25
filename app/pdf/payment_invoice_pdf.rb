class PaymentInvoicePdf < Prawn::Document
 
  def initialize(txn_details, payment, view)
    super()
  
    @txn_details = txn_details
    @payment = payment
  
    @view = view
    pad(1) { text "Payment Invoice" , :size => 18, :style => :bold , :position => :centre}
    define_grid(:columns => 5, :rows => 10, :gutter => 10)
  
    grid([0,4], [1,0]).bounding_box do
  
      logo_path = "#{Rails.root}/app/assets/images/bvc.jpeg"
      image logo_path, :width => 100, :height => 120, :position => :right
    end
  
    grid([1.7,3.6], [9,6]).bounding_box do
      text "Birdvision Consulting Pvt Ltd." , :size => 12, :style => :bold, :position => :right
      text "508-509, Tower-I, World Trade Center" , :size => 10, :position => :right
      text "Kharadi, Pune – 41101", :size => 10, :position => :right
    end
  
    grid([0.5,0], [1,1]).bounding_box do
      @user_info = User.find(@payment.user_id)
      text "Invoice No : CS#{invoice_no(@payment)}"
      move_down 5
      text "Invoice Date : #{@payment.created_at.to_date}"
      move_down 5
      text "User Name : #{@user_info.firstname} #{@user_info.lastname}"
      move_down 5
      text "User Address : #{@user_info.address_1}"
      move_down 10
    end
  
    pad(20) { text "Personal Details" , :size => 14, :style => :bold }
  
    personal_details(@payment, @txn_details)
  
    move_down 25
  
    pad(20) { text "Transaction Details" , :size => 14, :style => :bold }
  
    transaction_details(@txn_details)
    move_down 25
    text "Payment Mode - Net Banking "
  
    move_down 30
    text "* This is an electronically generated invoice. No signature required.", :style => :italic, :size => 10

  end

  private

  def personal_details(payment, txn_details)

    @payment = payment
    @txn_details = txn_details

    @user_name = User.find(@payment.user_id).firstname
    @email = @payment.payee_email
    @mobile = @payment.payee_mob_no

    personal_details = [
      [{:content => "User Name", :font_style => :bold}, @user_name],
      [{:content => "Email ID", :font_style => :bold}, @email],
      [{:content => "Mobile Number ", :font_style => :bold}, @mobile],
    ]
    table personal_details, :header => true, :column_widths => { 0 => 150, 1 => 390}

  end

  def transaction_details(txn_details)

    @txn_details = txn_details
    @base_amount = Plan.find(@txn_details.plan_id).base_amount
    @tax  = Plan.find(@txn_details.plan_id).service_tax
    @total_tax = (@base_amount*@tax.to_f/100).round(0)
    @total_amount = @base_amount + (@base_amount * @tax.to_f ) /100
    transaction_details = [
      [{:content => "Plan Name", :font_style => :bold}, @txn_details.plan_name],
      [{:content => "Base Amount (INR)", :font_style => :bold}, @base_amount],
      [{:content => "Service Tax(14%)", :font_style => :bold}, @total_tax],
      [{:content => "Total Amount", :font_style => :bold}, @total_amount],
      [{:content => "Amount in Words (INR)", :font_style => :bold}, @total_amount.to_i.rupees]
    ]
    table transaction_details, :header => true, :column_widths => { 0 => 150, 1 => 390}
  end

  def invoice_no(payment)

    @payment = payment

    if @payment.id.to_s.length == 1

      invoice_number = "000#{@payment.id}"

    return  invoice_number

    elsif @payment.id.to_s.length == 2

      invoice_number = "00#{@payment.id}"

    return  invoice_number

    elsif @payment.id.to_s.length == 3

      invoice_number = "0#{@payment.id}"

    return  invoice_number
    elsif @payment.id.to_s.length >= 4
    return  @payment.id
    end
  end

end