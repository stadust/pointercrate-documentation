<div class='panel fade js-scroll-anim' data-anim='fade'>

# List nation subdivisions

## `GET`{.verb} `/nationalities/` `iso_code`{.param} `/subdivisions/`

Returns a list of all subdivisions that belong to a nation.

### Request

_No data or headers required_

### Response: `200 OK`

| Header       | Value              |
| ------------ | ------------------ |
| Content-Type | `application/json` |

| Field | Type                                                     | Description |
| ----- | -------------------------------------------------------- | ----------- |
| -     | List[[Subdivision](/documentation/objects/#nationality)] | A list of subdivisions for this nation |

### Example request

```json
GET /api/v1/nationalities/US/subdivisions
Accept: application/json
```

</div>