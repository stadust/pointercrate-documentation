<div class='panel fade js-scroll-anim' data-anim='fade'>

# Country-based global ranking

## `GET`{.verb} `/nationalities/ranking`

### Filtering:

The result can be filtered by any of the following fields: `continent`, `name_contains`.

The endpoint uses a custom object to represent a ranked nation.

## Ranked nation objects

Object representing the ranking data for some nation

| Field       | Type    | Description |
| ----------- | ------- | ----------- |
| rank        | integer | Overall rank of this nation. This is not affected by any filters |
| score       | double  | Combined score of all players in this nation |
| nationality | [Nationality](/documentation/objects#nationality) | Combined score of all players in this nation |

### Request

_No data or headers required_

### Response: `200 OK`

| Header       | Value              |
| ------------ | ------------------ |
| Content-Type | `application/json` |

| Field | Type               | Description |
| ----- | ------------------ | ----------- |
| -     | List[RankedNation] | List of all ranked nations, sorted by score. |

### Example request

```json
GET /api/v1/nationalities/ranking
Accept: application/json
```

</div>