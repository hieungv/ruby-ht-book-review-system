class  ConfirmationsContoder <Devise::ConfirmationsControll

  private

  def  after_conf Confirmation_path_for ( resource_name , resource )
    sign_in (resource) # Trong trường hợp bạn muốn đăng nhập vào người dùng
    your_new_after_conf Confirmation_path
  end
end
