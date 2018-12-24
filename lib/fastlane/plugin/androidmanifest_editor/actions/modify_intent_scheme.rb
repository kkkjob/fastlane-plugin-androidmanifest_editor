module Fastlane
  module Actions
    class ModifyIntentSchemeAction < Action
      def self.run(params)
        manifest_file = params[:manifest_file]
        scheme = params[:scheme]

        require 'nokogiri'
        doc = File.open(manifest_file) { |f|
          @doc = Nokogiri::XML(f)

          @doc.css("intent-filter data").each do |response_node|
            response_node["android:scheme"] = scheme
          end
          
          File.write(manifest_file, @doc.to_xml)
        }
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :manifest_file,
                               description: "Path of AndroidManifest.xml",
                                  optional: false,
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :scheme,
                               description: "scheme",
                                  optional: false,
                                      type: String)
        ]
      end

      def self.description
        "edit scheme data of intent-filter in AndroidManifest.xml"
      end

      def self.authors
        ["任福新"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        "edit scheme data of intent-filter of application section in AndroidManifest.xml"
      end

      def self.is_supported?(platform)
        [:android].include?(platform)
      end

    end
  end
end