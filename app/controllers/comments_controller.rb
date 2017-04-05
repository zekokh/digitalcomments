class CommentsController < ApplicationController
  def get_media
    begin
      params_to_access_token = { client_id: $connect.client_id,
                                 client_secret: $connect.client_secret,
                                 grant_type: 'authorization_code',
                                 redirect_uri: 'http://localhost:3000/information_to_connects',
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

  def get_comments

  end
end
