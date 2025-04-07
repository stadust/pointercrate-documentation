<div class='panel fade js-scroll-anim' data-anim='fade'>

# Player ranking retrieval.{id=get-player-ranking}

## `GET`{.verb} `/players/ranking/` `player_id`{.param} `/`

Retrieves detailed information about the player with id `player_id`, including the player's rank

### Request:

| Header        | Expected Value                                                                                                                                                                                              | Optional |
| ------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| If-Match      | Conditional request header. If the etag value of the requested data matches any of the here provided values, the data is returned as requested. Otherwise a `412 PRECONDITION FAILED` response is generated | true     |
| If-None-Match | Conditional request header. If the etag value of the requested data does not match any of the here provided values, if it returned as requested. Otherwise, a `304 NOT MODIFED` response is generated       | true     |

### Response: `200 OK`

| Header       | Value                                     |
| ------------ | ----------------------------------------- |
| Content-Type | `application/json`                        |
| ETag         | unsigned 64 bit hash of the player object |

| Field | Type                    | Description                 |
| ----- | ----------------------- | --------------------------- |
| data  | [RankedPlayer](#player) | The requested player object |

### Response: `304 NOT MODIFIED`

Returned if the `If-None-Match` header is set, and the etag for the player object matches one of the set values.

| Header | Value                                      |
| ------ | ------------------------------------------ |
| ETag   | unsigned 64 bit  hash of the player object |

### Errors:

| Status code | Error code | Description                             |
| ----------- | ---------- | --------------------------------------- |
| 404         | 40401      | No player with id `player_id` was found |

### Example request:

```json
GET /api/v1/players/ranking/1/
Accept: application/json
```

</div>
