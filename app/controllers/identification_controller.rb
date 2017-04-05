class IdentificationController < ApplicationController

  def get_info

  end

  def info
    $connect
  end

  def get_code
    $connect.code = params[:code]
    redirect_to root_path
  end

  def get_token
    begin
      #response = RestClient.get 'https://api.instagram.com/oauth/authorize/?client_id=24626bd21aa74c0f8af7d7e41b992323&redirect_uri=http://localhost:3000/information_to_connects&response_type=code'
      params_to_access_token = { client_id: $connect.client_id,
                                 client_secret: $connect.client_secret,
                                 grant_type: 'authorization_code',
                                 redirect_uri: 'http://digitalcomment.herokuapp.com/information_to_connects',
                                 code: $connect.code }
      json ||= JSON.parse(RestClient.post 'https://api.instagram.com/oauth/access_token', params_to_access_token)
      access_token = json['access_token']
      puts(access_token)

      if $connect.access_token = access_token
        redirect_to root_path
      else
        redirect_to root_path, notice: 'Произошла неведомая ошибка!'
      end
    rescue => e
      redirect_to root_path, notice: "Ошибка: #{e.response}"
    end
  end
end
