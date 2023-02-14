<div class='panel fade js-scroll-anim' data-anim='fade'>

# Movement log entry{id=movement-entry}

Represents the cause for one movement of a demon. This includes the shifting of other levels.

| Field        | Type           | Description |
| ------------ | -------------- | ----------- |
| reason       | MovementReason | May be a string or an object. See below. |
| time         | string         | Date and time of the movement in ISO 8601 format |
| new_position | integer?       | Position of the demon after the move. This field is missing for deletions. |

## Movement reason data

The key of this object will always be one of the following strings:

"Added", "Moved", "OtherAddedAbove", "OtherMoved", "Unknown"

For values of "OtherAddedAbove" and "OtherMoved", this key can be used to index an object containing an "other" field. This field will contain a [NamedId](#named-id) that represents the offending demon.

It's probably more clear to look at the examples.

## Example objects

```json
{
		"reason": "Added",
		"time": "2018-05-21T12:00:00",
		"new_position": 40
}
```

```json
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
```

</div>