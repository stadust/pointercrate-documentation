<div class='panel fade js-scroll-anim' data-anim='fade'>

# Removing creators

## `DELETE`{.verb} `/v2/demons/` `demon_id`{.param} `/creators/` `player_id`{.param} `/`

<div class='info-yellow'>
<b>Access Restrictions:</b><br>
Access to this endpoint requires at least `ListModerator` permissions.
</div>

Removes the specified player from the creator list of the demon with the specified `demon_id`.

### Request:

| Header        | Expected Value                                             | Optional |
| ------------- | ---------------------------------------------------------- | -------- |
| Authorization | [Pointercrate access token](/documentation/#access-tokens) | false    |

### Response: `204 NO CONTENT`

_Nothing_

### Errors:

| Status code | Error code | Description                                     |
| ----------- | ---------- | ----------------------------------------------- |
| 404         | 40401      | No demon with the specified `demon_id`           |
| 404         | 40401      | No player with the specified `player_id`        |
| 409         | 40906      | The given player is not registered as a creator |

### Example request:

```json
DELETE /api/v2/demons/2/creators/1/
Accept: application/json
Authorization: Bearer <omitted>
```

</div>
