class AccountsController < ApplicationController
  
  
  def create
    provider = request.env['omniauth.auth']['provider']
    # template_id = request.env['omniauth.params']['email_template_id']
    # template = current_user.email_templates.find(template_id)
    case provider
      when 'bigcommerce'
        auth = request.env['omniauth.auth']
        token = auth['credentials']['token'].token
        account = Account.create!(name: provider, token: token)
        redirect_to fetch_account_products_path(account)
    end
  end
end
