<div class='panel fade js-scroll-anim' data-anim='fade'>

# Modifying player claims

## `PATCH`{.verb} `/players/` `player_id`{.param} `/claims/` `user_id`{.param} `/`

<div class='info-yellow'>
<b>Access Restrictions:</b><br>
Access to this endpoint requires at least `MODERATOR` permissions if modifying the verification status of a claim.
</div>

Modifies the specified claim. Only the owning user can modify the lock_submissions field.

### Request:

| Header       | Expected Value     | Optional |
| ------------ | ------------------ | -------- |
| Content-Type | `application/json` | false    |
| Authorization | [Pointercrate access token](/documentation/#access-tokens)                                 | false    |

| Field       | Type         | Description                            | Optional |
| ----------- | ------------ | -------------------------------------- | -------- |
| verified         | boolean | If this claim should be verified (the user should own the player) | true    |
| lock_submissions | boolean | If the player should require authentication by the user for submissions | true    |

### Response: `200 OK`

| Header       | Value                                           |
| ------------ | ----------------------------------------------- |
| Content-Type | `application/json`                              |

| Field | Type                                   | Description                    |
| ----- | -------------------------------------- | ------------------------------ |
| data  | [PlayerClaim](/documentation/objects/#player-claim) | The edited player claim object |

### Errors:

| Status code | Error code | Description                                                                                          |
| ----------- | ---------- | ---------------------------------------------------------------------------------------------------- |
| 404         | 40401      | No claim or player with the specified ID exists |
| 403         | 40306      | Attempt to modify an unverified claim |

### Example request:

```json
POST /api/v1/players/34/claims/1/
Accept: application/json
Authorization: Bearer <omitted>
Content-Type: application/json

{
    "verified": true
}
```

</div>
