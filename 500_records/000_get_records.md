% records

<div class='panel fade js-scroll-anim' data-anim='fade'>

# Record listing{id=get-records}

## `GET`{.verb} `/records/`

<div class='info-green'>
<b>Pagination:</b><br>
This endpoint supports [pagination and filtering](/documentation/#pagination) via query parameters. Please see the documentation on pagination for information
on the additional request and response fields headers.
</div>

Allows retrieving a list of records.

Only users with `ListHelper`` or higher permissions can see non-approved records or the anonymized submitter ID (for all other users, the `submitter` field of the record objects will be set to `null`).

### Filtering

The result can be filtered by any of the following fields: `progress`, `status` (only possible for users with `ListHelper` permissions), `player`, `video`, `demon` (for filtering demons by name), `demon_position` (for filtering demons by position), `demon_id` (for filtering demons by id) and `submitter` (only possible for users with `ListModerator` permissions). The fields `progress` and `demon_position` support inequality based filtering.

Pagination is done via the `id` field.

### Request

| Header        | Expected Value                                             | Optional |
| ------------- | ---------------------------------------------------------- | -------- |
| Authorization | [Pointercrate access token](/documentation/#access-tokens) | true     |

### Response: `200 OK`

| Header       | Value              |
| ------------ | ------------------ |
| Content-Type | `application/json` |

| Field | Type                                           | Description       |
| ----- | ---------------------------------------------- | ----------------- |
| -     | List[[Record](/documentation/objects/#record)] | A list of records |

### Example request

```json
GET /api/v1/records/
Accept: application/json
```

</div>
