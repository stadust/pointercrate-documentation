<div class='panel fade js-scroll-anim' data-anim='fade'>

# Player claim listing

## `GET`{.verb} `/players/claims/`

<div class='info-green'>
<b>Pagination:</b><br>
This endpoint supports [pagination and filtering](/documentation/#pagination) via query parameters. Please see the documentation on pagination for information
on the additional request and response fields headers.
</div>

<div class='info-yellow'>
<b>Access Restrictions:</b><br>
Access to this endpoint requires at least `MODERATOR` permissions.
</div>

This endpoint gets a list of all claims.

Additionally, the endpoint uses its own special format for [PlayerClaim](/documentation/objects#player-claim) objects, which defines a "listed form" for the claim.

| Field    | Type                 | Description                                       |
| -------- | -------------------- | ------------------------------------------------- |
| id       | integer              | The id of the claim                               |
| user     | [NamedId](#named-id) | The name and id of the user owning the claim      |
| player   | [NamedId](#named-id) | The name and id of the player claimed by the user |
| verified | boolean              | If this claim was verified by a Moderator         |

### Filtering:

The result can be filtered by `verified` and by `any_name_contains`, which causes the endpoint to only return players or users whose name contains the given substring.

Pagination is done by the `id` field.

### Request:

| Header        | Expected Value                                             | Optional |
| ------------- | ---------------------------------------------------------- | -------- |
| Authorization | [Pointercrate access token](/documentation/#access-tokens) | false    |

### Response: `200 OK`

| Header       | Value              |
| ------------ | ------------------ |
| Content-Type | `application/json` |

| Field | Type               | Description                                          |
| ----- | ------------------ | ---------------------------------------------------- |
| -     | List[ListedClaim] | A list of claims (see above for the special format) |

### Example request:

```json
GET /api/v1/players/claims/
Accept: application/json
Authorization: Bearer <omitted>
```

</div>
