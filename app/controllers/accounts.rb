Blog::App.controllers :accounts do
  get :new do
    @title = pat(:new_title, :model => 'account')
    @account = Account.new
    render 'accounts/new'
  end

  post :create do
    params[:account][:role] = "user"
    @account = Account.new(params[:account])
    if @account.save
      @title = pat(:create_title, :model => "account #{@account.id}")
      flash[:success] = pat(:create_success, :model => 'Account')
        redirect(url(:logins, :new))
    else             
      @title = pat(:create_title, :model => 'account')
      flash.now[:error] = pat(:create_error, :model => 'account')
      render 'accounts/new'
    end
  end

  get :edit, :with => :id do
    @title = pat(:edit_title, :model => "account #{params[:id]}")
    @account = Account.find(params[:id])
    if @account
      render 'accounts/edit'
    else
      flash[:warning] = pat(:create_error, :model => 'account', :id => "#{params[:id]}")
      halt 404
    end
  end

  put :update, :with => :id do
    @title = pat(:update_title, :model => "account #{params[:id]}")
    @account = Account.find(params[:id])
    if @account
      if @account.update_attributes(params[:account])
        flash[:success] = pat(:update_success, :model => 'Account', :id =>  "#{params[:id]}")
        params[:save_and_continue] ?
          redirect(url(:accounts, :index)) :
          redirect(url(:accounts, :edit, :id => @account.id))
      else
        flash.now[:error] = pat(:update_error, :model => 'account')
        render 'accounts/edit'
      end
    else
      flash[:warning] = pat(:update_warning, :model => 'account', :id => "#{params[:id]}")
      halt 404
    end
  end
end
