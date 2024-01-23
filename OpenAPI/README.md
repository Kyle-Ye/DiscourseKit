## Base

Based on https://github.com/discourse/discourse_api_docs/blob/d518e0f3d6f94f4992c3cb11e8f628e2508c0869/openapi.yml

## Diff

1. /site.json/categories/permission's type add null

See `0001-permission.patch`

2. /site.json/additionalProperties set to true

Because some site may contain extra info here (eg. https://forums.swift.org/site.json contains 3 extra key-values pairs)

```
"tos_url": "/tos",
"privacy_policy_url": "https://www.apple.com/legal/privacy/en-ww/",
"hosting_tier": "enterprise",
```

See `0002-additionalProperties.patch`

3. /categories.json/permission's type add null and can_edit to non-required value

See `0003-categories.patch`

4. /primary_group_id: String? -> Int?

See `0004-primary_group_id.patch`

5. /t/{id}.json

See `0005-Title-add-null-type.patch`

6. Update actions_summary

See `0006-Update-actions_summary.patch`

7. Fix topic API

- Add flair_group_id & can_accept_answer & can_unaccept_answer & accepted_answer & topic_accepted_answer & can_vote
- Remove required of link_counts, reviewable_id, reviewable_score_count and reviewable_score_pending_count

See `0007-fix_topic_api`

8. Fix reply_to_post_number type from string to integer

See `0008-Fix-reply_to_post_number-type.patch`

9. Add missing types for post

See `0009-Add-missing-types-for-post.patch`
