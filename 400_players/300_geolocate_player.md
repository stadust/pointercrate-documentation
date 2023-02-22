<div class='panel fade js-scroll-anim' data-anim='fade'>

# Geolocate current player

## `POST`{.verb} `/players/` `player_id`{.param} `/geolocate`

<div class='info-yellow'>
<b>Rate Limits:</b><br>
This endpoint is ratelimited at 1 request per 31 days
</div>

Geolocates the player associated with the current logged in user. This means that the user's IP address is used to determine the current location of the user.

The user must have a verified player claim, or this endpoint returns an error.

### Request:

| Header        | Expected Value                                                                           | Optional |
| ------------- | ---------------------------------------------------------------------------------------- | -------- |
| Content-Type  | `application/json`                                                           | false    |
| Authorization | Basic access authentication header                                                       | false    |

### Response: `200 OK`

| Header       | Value                                    |
| ------------ | ---------------------------------------- |
| Content-Type | `application/json`                       |

| Field | Type                                 | Description                                                 |
| ----- | ------------------------------------ | ----------------------------------------------------------- |
| data  | [Nationality](/documentation/objects/#nationality) | A nationality object representing the country/subdivision that the endpoint placed the player in |

### Errors:

| Status code | Error code | Description                                                                               |
| ----------- | ---------- | ----------------------------------------------------------------------------------------- | 
| 403         | 40306      | The current user has no verified claims on any player |
| 403         | 40307      | An attempt to geolocate through a VPN was detected |

### Example request:

```json
PATCH /api/v1/players/32/geolocate/
Accept: application/json
Authorization: Basic <omitted>
```

</div>
