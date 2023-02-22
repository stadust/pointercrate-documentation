% records

<div class='panel fade js-scroll-anim' data-anim='fade'>

# Record note listing

## `GET`{.verb} `/api/v1/records/` `record_id`{.param} `/notes/`

<div class='info-yellow'>
<b>Access Restrictions:</b><br>
Unless the user accessing the notes for this record owns the player associated with it, access to this endpoint requires at least `LIST_HELPER` permissions.
</div>


Allows retrieving a list of notes associated with the specified record.

If a user is not `LIST_HELPER`, only notes where `is_public` is true will be shown.

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
| -     | List[[Note](/documentation/objects/#record-note)] | A list of the notes associated with this record |

### Errors:

| Status code | Error code | Description                            |
| ----------- | ---------- | -------------------------------------- |
| 404         | 40401      | No record with the specified ID exists |

### Example request

```json
GET /api/v1/records/2/notes/
Authorization: Bearer <omitted>
Accept: application/json
```

</div>
