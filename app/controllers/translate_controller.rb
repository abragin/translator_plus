class TranslateController < ApplicationController
  include KaTransliteration

  def index
    @source = session[:source]
    if @source
      client = Google::Cloud::Translate.translation_service do |config|
        config.credentials = Rails.configuration.translate_api.credentials_file
      end
      @result = client.translate_text(
        contents: [transliterate(@source)],
        target_language_code: "ru",
        source_language_code: "ka",
        parent: Rails.configuration.translate_api.parent
      ).translations[0].translated_text
    end
  end

  def translate
    session[:source] = params[:source]
    redirect_to action: :index
  end
end
