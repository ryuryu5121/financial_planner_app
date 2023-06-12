class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        forwarding_url = session[:forwarding_url]
        reset_session
        log_in user
        redirect_to forwarding_url || user
      else
        flash[:warning] = 'アカウントは有効化されていません。リンクのメールアドレスを確認して下さい。'
        redirect_to root_url
      end
    else
      flash.now[:danger] = '無効なメールアドレス・パスワードです'
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    log_out
    redirect_to root_url, status: :see_other
  end
end
