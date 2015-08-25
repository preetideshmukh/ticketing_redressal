class EmailsController &lt; ActionController::Base
  def create
    if EmailToSmsReceiver.receive(request)
      render :json =&gt; { :status =&gt; 'ok' }
    else
      render :json =&gt; { :status =&gt; 'rejected' }, :status =&gt; 403
    end
  end
end