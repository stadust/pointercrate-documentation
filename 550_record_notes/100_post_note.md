<div class='panel fade js-scroll-anim' data-anim='fade'>

# Adding record notes

## `POST`{.verb} `/api/v1/records/` `record_id`{.param} `/notes/`

<div class='info-yellow'>
<b>Access Restrictions:</b><br>
Access to this endpoint requires at least `LIST_HELPER` permissions.
</div>

Adds a note to the specified record.

### Request:

| Header       | Expected Value     | Optional |
| ------------ | ------------------ | -------- |
| Content-Type | `application/json` | false    |
| Authorization | [Pointercrate access token](/documentation/#access-tokens)                                 | false    |

| Field       | Type         | Description                            | Optional |
| ----------- | ------------ | -------------------------------------- | -------- |
| content        | string       | The content of the new note                  | false    |
| is_public      | boolean       | If this note should be visible to the record submitter | true |


### Response: `201 CREATED`

| Header       | Value                                           |
| ------------ | ----------------------------------------------- |
| Content-Type | `application/json`                              |
| Location     | The location of the newly created demon         |
| ETag         | unsigned 64 bit hash of the newly created note |

| Field | Type                                   | Description                    |
| ----- | -------------------------------------- | ------------------------------ |
| data  | [Note](/documentation/objects/#record-note) | The newly created record note object |

### Errors:

| Status code | Error code | Description                                                                                          |
| ----------- | ---------- | ---------------------------------------------------------------------------------------------------- |
| 404         | 40401      | No record with the specified ID exists                                          |
| 422         | 42230      | The `content` field is the empty string                    |

### Example request:

```json
POST /api/v1/records/1/notes/
Accept: application/json
Authorization: Bearer <omitted>
Content-Type: application/json

{
    "content": "Maybe hacked, waiting on proof-stream"
}
```

</div>
