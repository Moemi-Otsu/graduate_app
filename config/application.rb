require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module GraduateApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # デフォルトの言語を日本語に設定する
    # config.i18n.default_locale = :ja
    # タイムゾーン設定
    config.time_zone = 'Tokyo'
    # Rails(Activerecord)がDBへのRead・Writeを行う際タイムゾーン
    config.active_record.default_timezone = :local
    # CSS、JavaScript、Helperのファイルをrails g コマンドで自動生成しない設定
    config.generators do |g|
      # この二行の記述で自動生成しない設定を作成しています。
      g.assets false
      g.helper false
    end
  
  end
end
