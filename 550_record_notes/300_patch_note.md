<div class='panel fade js-scroll-anim' data-anim='fade'>

# Modifying record notes

## `PATCH`{.verb} `/api/v1/records/` `record_id`{.param} `/notes/` `note_id`{.param} `/`

<div class='info-yellow'>
<b>Access Restrictions:</b><br>
Access to this endpoint requires at least `LIST_HELPER` permissions if you modify your own note, or `LIST_ADMINISTRATOR` to modify arbitrary notes.
</div>

Modifies the specified note's content

### Request:

| Header       | Expected Value     | Optional |
| ------------ | ------------------ | -------- |
| Content-Type | `application/json` | false    |
| Authorization | [Pointercrate access token](/documentation/#access-tokens)                                 | false    |

| Field       | Type         | Description                            | Optional |
| ----------- | ------------ | -------------------------------------- | -------- |
| content        | string       | The new content of the  note                  | true    |
| is_public      | boolean       | If this note should be visible to the record submitter | true |

### Response: `200 OK`

| Header       | Value                                           |
| ------------ | ----------------------------------------------- |
| Content-Type | `application/json`                              |
| Location     | The location of the newly created demon         |
| ETag         | unsigned 64 bit hash of the note |

| Field | Type                                   | Description                    |
| ----- | -------------------------------------- | ------------------------------ |
| data  | [Note](/documentation/objects/#record-note) | The newly created record note object |

### Errors:

| Status code | Error code | Description                                                                                          |
| ----------- | ---------- | ---------------------------------------------------------------------------------------------------- |
| 404         | 40401      | No record with the specified ID exists, or no note with the specified ID exists                                          |
| 422         | 42230      | The `content` field is the empty string                    |

### Example request:

```json
POST /api/v1/records/1/notes/1/
Accept: application/json
Authorization: Bearer <omitted>
Content-Type: application/json

{
    "content": "Maybe hacked, waiting on proof-stream"
}
```

</div>
