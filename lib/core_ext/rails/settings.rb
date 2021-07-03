module Rails
  class Settings
    class << self
      def base
        @@_rails_settings ||= Rails.application.config_for(:settings).freeze
      end

      def name
        base[:name]
      end

      delegate_missing_to :base
    end
  end

  class << self
    def settings
      Settings
    end
  end
end
