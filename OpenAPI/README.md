## Base

Based on https://github.com/discourse/discourse_api_docs/blob/d518e0f3d6f94f4992c3cb11e8f628e2508c0869/openapi.yml

## Diff

1. site.json/categories/permission's type add null

See `0001-permission.patch`

2. site.json/additionalProperties set to true

Because some site may contain extra info here (eg. https://forums.swift.org/site.json contains 3 extra key-values pairs)

```
"tos_url": "/tos",
"privacy_policy_url": "https://www.apple.com/legal/privacy/en-ww/",
"hosting_tier": "enterprise",
```

See `0002-additionalProperties.patch`