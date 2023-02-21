<div class='panel fade js-scroll-anim' data-anim='fade'>

# Add player claim

## `PUT`{.verb} `/players/` `player_id`{.param} `/claims`

Creates a claim on the player for the current authenticated user. Errors if a player already has a verified claim, and will remove any claim that the user currently has.

### Request:

| Header        | Expected Value                                             | Optional |
| ------------- | ---------------------------------------------------------- | -------- |
| Content-Type  | `application/json`                                         | false    |
| Authorization | [Pointercrate access token](/documentation/#access-tokens) | false    |

### Response: `201 CREATED`

| Header       | Value |
| ------------ | ----- |
| Content-Type | `application/json` |
| Location     | URL to access the current user's claim on the player |

| Field | Type                                          | Description              |
| ----- | --------------------------------------------- | ------------------------ |
| data  | [PlayerClaim](/documentation/objects/#player-claim) | The created claim object |

### Errors:

| Status code | Error code | Description |
| ----------- | ---------- | ----------- |
| 404         | 40401      | No player with id `player_id` was found, or the specified nationality or subdivision wasn't recognized |
| 422         | 42231      | Player already has an associated verified claim |

### Example request:

```json
PUT /api/v1/players/1/claims
Accept: application/json
Authorization: Bearer <omitted>
```

</div>
