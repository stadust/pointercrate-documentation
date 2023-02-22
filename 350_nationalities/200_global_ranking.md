<div class='panel fade js-scroll-anim' data-anim='fade'>

# Country-based global ranking

## `GET`{.verb} `/nationalities/ranking`

Returns a list of objects that combines all player profiles in one country and sorts by the total score.

The endpoint uses a custom object to represent a ranked nation.

| Field       | Type    | Description |
| ----------- | ------- | ----------- |
| rank        | integer | Overall rank of this nation. This is not affected by any filters |
| score       | double  | Combined score of all players in this nation |
| nationality | [Nationality](/documentation/objects#nationality) | Combined score of all players in this nation |

### Filtering:

The result can be filtered by any of the following fields: `continent`, `name_contains`.

### Request

_No data or headers required_

### Response: `200 OK`

| Header       | Value              |
| ------------ | ------------------ |
| Content-Type | `application/json` |

| Field | Type               | Description |
| ----- | ------------------ | ----------- |
| -     | List[RankedNation] | List of all ranked nations, sorted by score. See above for format. |

### Example request

```json
GET /api/v1/nationalities/ranking
Accept: application/json
```

</div>