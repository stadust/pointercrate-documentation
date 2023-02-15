<div class='panel fade js-scroll-anim' data-anim='fade'>

# Nation profile

## `GET`{.verb} `/nationalities/` `iso_code`{.param} `/`

Returns a profile featuring the combined statistics of the provided nation.

The endpoint uses its own special format for [Demon](/documentation/objects#demon) and [Record](/documentation/objects#record) objects, which is a modified version of the listed form.

## Nationality record objects

Object representing a combination of all of a nation's stats

| Field     | Type   | Description |
| --------- | ----------- | ----------- |
| nation    | [Nationality](/documentation/objects#nationality) | Information of the nation being represented |
| records   | List[BestRecord] | Best records achieved by this nation. Only approved records are listed. |
| created   | List[MiniDemonWithPlayers] | Demons where at least one creator from this nation is listed. `players` field represents the creators from this nation involved. |
| published | List[MiniDemon] | Published demons by this nation. `player` field represents publisher. |
| unbeaten  | List[[MinimalDemon](/documentation/objects#demon)] | Demons not yet completed by this nation. |

## Best Record Form

This form of a record is almost a combination of the [MinimalRecord](/documentation/objects#record) and [MinimalDemon](/documentation/objects#demon).

| Field    | Type         | Description |
| -------- | ------------ | ----------- |
| id       | integer      | The record's id |
| demon    | string       | Name of the demon this record was made on |
| position | integer      | Position of the demon this record was made on |
| progress | integer      | The progress achieved by the best record holder |
| players  | List[string] | List of player names from the same nation who share this record |

## Mini Demon

This form is similar to the [MinimalDemon](/documentation/objects#demon), but with a player field.

| Field    | Type    | Description |
| -------- | ------- | ----------- |
| name     | string  | The name of the demon. |
| position | integer | The position of the demon. |
| id       | integer | The demon's internal ID (has nothing to do with its level ID on the geometry dash servers) |
| player   | string  | Name of player relevant to the demon in some way (verification, publishing, etc.) |

## Mini Demon With Players

This form is similar to the mini demon, but supports multiple players. This is only used for the created field of the [NationalityRecord](#nationality).

| Field    | Type          | Description |
| -------- | ------------- | ----------- |
| name     | string        | The name of the demon. |
| position | integer       | The position of the demon. |
| id       | integer       | The demon's internal ID (has nothing to do with its level ID on the geometry dash servers) |
| players  | List[string]  | Name of players relevant to the demon in some way (had a created part) |

### Request

_No data or headers required_

### Response: `200 OK`

| Header       | Value              |
| ------------ | ------------------ |
| Content-Type | `application/json` |

| Field | Type                                         | Description      |
| ----- | -------------------------------------------- | ---------------- |
| data  | NationalityRecord | The requested profile of the nationality |

### Example request

```json
GET /api/v1/nationalities/KP
Accept: application/json
```

</div>