<div class='panel fade js-scroll-anim' data-anim='fade' style="position: relative">

# List ranked demons

## `GET`{.verb} `/v2/demons/` `id`{.param} `/audit/movement`

Retrieves a list of the movement changes for a demon with the given `id`.

This endpoint uses a special anonymized form of the [AuditLogEntry](/documentation/objects/#audit-log-entry) object. 

### Movement log entry

Represents the cause for one movement of a demon. This includes the shifting of other levels.

| Field        | Type           | Description |
| ------------ | -------------- | ----------- |
| reason       | MovementReason | May be a string or an object. See below. |
| time         | string         | Date and time of the movement in ISO 8601 format |
| new_position | integer?       | Position of the demon after the move. This field is missing for deletions. |

The key of the `MovementReason` object will always be one of the following strings:

"Added", "Moved", "OtherAddedAbove", "OtherMoved", "Unknown"

For values of "OtherAddedAbove" and "OtherMoved", this key can be used to index an object containing an "other" field. This field will contain a [NamedId](/documentation/objects/#named-id) that represents the offending demon.

It's probably more clear to look at the examples.

### Request:

_No request data required_

### Response: `200 OK`

| Header       | Value              |
| ------------ | ------------------ |
| Content-Type | `application/json` |

| Field | Type                                         | Description      |
| ----- | -------------------------------------------- | ---------------- |
| -     | List[MovementLogEntry] | A list of movement log entries (see above for format) |

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
