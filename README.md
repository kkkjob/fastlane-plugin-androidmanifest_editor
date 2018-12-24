# androidmanifest_editor plugin

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-androidmanifest_editor)

## Getting Started

This project is a [_fastlane_](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-androidmanifest_editor`, add it to your project by running:

```bash
fastlane add_plugin androidmanifest_editor
```

## About androidmanifest_editor

edit meta-data in AndroidManifest.xml

**Note to author:** Add a more detailed description about this plugin here. If your plugin contains multiple actions, make sure to mention them here.

## Example

```
modify_meta_data (
  manifest_file: 'src/main/AndroidManifest.xml',
  meta_info: {
    'WEIXIN_APP_ID' => weixin_app_id,
    'BUGLY_APPID' => bugly_app_id
  }
)

modify_intent_scheme (
  manifest_file: 'src/main/AndroidManifest.xml',
  scheme: "xingyue"
)
```

## Run tests for this plugin

To run both the tests, and code style validation, run

```
rake
```

To automatically fix many of the styling issues, use
```
rubocop -a
```

## Issues and Feedback

For any other issues and feedback about this plugin, please submit it to this repository.

## Troubleshooting

If you have trouble using plugins, check out the [Plugins Troubleshooting](https://docs.fastlane.tools/plugins/plugins-troubleshooting/) guide.

## Using _fastlane_ Plugins

For more information about how the `fastlane` plugin system works, check out the [Plugins documentation](https://docs.fastlane.tools/plugins/create-plugin/).

## About _fastlane_

_fastlane_ is the easiest way to automate beta deployments and releases for your iOS and Android apps. To learn more, check out [fastlane.tools](https://fastlane.tools).
