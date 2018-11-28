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

      def self.modify_meta_data(params)
        manifest_file = params[:manifest_file]
        meta_info = params[:meta_info]

        require 'nokogiri'
        doc = File.open(manifest_file) { |f|
          @doc = Nokogiri::XML(f)

          meta_info.each { |meta_key, mata_value|
            node_found = false
            @doc.css("application meta-data").each do |response_node|
              if response_node["android:name"] == meta_key
                response_node["android:value"] = meta_value

                node_found = true
                UI.message("Found existing node and changed its value to: #{meta_value}")
                break
              end
            end

            if not node_found
              @doc.xpath("//application//activity").last.add_next_sibling "<meta-data android:name=\"#{meta_key}\" android:value=\"#{meta_value}\" />"
              UI.message("Insert new node with value #{meta_value} into xml file")
            end
          }
          
          File.write(manifest_file, @doc.to_xml)
        }
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
