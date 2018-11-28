require 'fastlane/action'
require_relative '../helper/androidmanifest_editor_helper'

module Fastlane
  module Actions
    class AndroidmanifestEditorAction < Action
      def self.run(params)
        UI.message("The androidmanifest_editor plugin is working!")
      end

      def self.description
        "edit meta-data in AndroidManifest.xml"
      end

      def self.authors
        ["任福新"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "edit meta-data of application section in AndroidManifest.xml"
      end

      def self.available_options
        [
          # FastlaneCore::ConfigItem.new(key: :your_option,
          #                         env_name: "ANDROIDMANIFEST_EDITOR_YOUR_OPTION",
          #                      description: "A description of your option",
          #                         optional: false,
          #                             type: String)
        ]
      end

      def self.is_supported?(platform)
        [:android].include?(platform)
      end
    end
  end
end
