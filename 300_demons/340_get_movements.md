<div class='panel fade js-scroll-anim' data-anim='fade' style="position: relative">

# List ranked demons

## `GET`{.verb} `/v2/demons/` `id`{.param} `/audit/movement`

Retrieves a list of the movement changes for a demon with the given `id`.

### Request:

_No request data required_

### Response: `200 OK`

| Header       | Value              |
| ------------ | ------------------ |
| Content-Type | `application/json` |

| Field | Type                                         | Description      |
| ----- | -------------------------------------------- | ---------------- |
| -     | List[[MovementLogEntry](/documentation/objects/#movement-entry)] | A list of movement log entries |

### Example request:

```json
GET /api/v2/demons/1/audit/movement
Accept: application/json
Content-Type: application/json

[
    {
        "reason": "added",
        "time": "2018-05-21T12:00:00",
        "new_position": 40
    },
    {
        "reason": {
            "OtherAddedAbove": {
                "other": {
                        "id": 242,
                        "name": "SPEEDRUN"
                    }
                }
            },
        "time":"2020-01-02T22:45:51.013683",
        "new_position": 41
    }
]
```

</div>
