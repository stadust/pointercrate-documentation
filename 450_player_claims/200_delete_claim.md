<div class='panel fade js-scroll-anim' data-anim='fade'>

# Deleting player claims

## `PATCH`{.verb} `/players/` `player_id`{.param} `/claims/` `user_id`{.param} `/`

<div class='info-yellow'>
<b>Access Restrictions:</b><br>
Access to this endpoint requires at least `MODERATOR` permissions.
</div>

Deletes the specified claim.

### Request:

| Header       | Expected Value     | Optional |
| ------------ | ------------------ | -------- |
| Authorization | [Pointercrate access token](/documentation/#access-tokens)                                 | false    |

### Response: `204 NO CONTENT`

_Nothing_

### Errors:

| Status code | Error code | Description                                                                                          |
| ----------- | ---------- | ---------------------------------------------------------------------------------------------------- |
| 404         | 40401      | No claim or player with the specified ID exists |

### Example request:

```json
DELETE /api/v1/players/34/claims/1/
Authorization: Bearer <omitted>
```

</div>
