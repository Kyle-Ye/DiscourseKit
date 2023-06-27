- primary_group_id
  - type: string -> integer

# Upstream does not support required with null https://github.com/apple/swift-openapi-generator/issues/82
Remove groups
- groups
  - required: remove flair_url flair_bg_color flair_color

