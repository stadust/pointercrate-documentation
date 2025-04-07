<div class='panel fade js-scroll-anim' data-anim='fade'>

# Player ranking{id=get-ranking}

## `GET`{.verb} `/players/ranking/`

<div class='info-green'>
<b>Pagination:</b><br>
This endpoint supports [pagination and filtering](/documentation/#pagination) via query parameters. Please see the documentation on pagination for information
on the additional request and response fields headers.
</div>

This endpoint is used by the stats viewer. It is a more limited (and slower) version of `/players/`. It should only be used if the additional information (player scores and ranking) is actually required.

### Filtering:

The result can be filtered by `nation` (which accepts both country code and country name), `subdivision` (which only accepts the subdivision code), `continent` (which only accepts continent name) and by `name_contains`, which causes the endpoint to only return players whose name contains the given substring.

Since none of the fields have the characteristics required of a pagination field (results aren't sorted by `id`, `score` is a floating point value and `rank` is not unique), pagination is done via a pseudo-field that is not contained in the response.

### Request:

| Header        | Expected Value                                             | Optional |
| ------------- | ---------------------------------------------------------- | -------- |
| Authorization | [Pointercrate access token](/documentation/#access-tokens) | false    |

### Response: `200 OK`

| Header       | Value              |
| ------------ | ------------------ |
| Content-Type | `application/json` |

| Field | Type               | Description                                         |
| ----- | ------------------ | --------------------------------------------------- |
| -     | List[[RankedPlayer](#player)] | A list of players, including their ranks |

### Example request:

```json
GET /api/v1/players/ranking/
Accept: application/json
Authorization: Bearer <omitted>
```

</div>
