<div class='panel fade js-scroll-anim' data-anim='fade'>

# Deleting record notes

## `DELETE`{.verb} `/api/v1/records/` `record_id`{.param} `/notes/` `note_id`{.param} `/`

<div class='info-yellow'>
<b>Access Restrictions:</b><br>
Access to this endpoint requires at least `LIST_HELPER` permissions if you delete your own note, or `LIST_ADMINISTRATOR` to delete arbitrary notes.
</div>

Deletes the specified note

### Request:

| Header       | Expected Value     | Optional |
| ------------ | ------------------ | -------- |
| Authorization | [Pointercrate access token](/documentation/#access-tokens)                                 | false    |

### Response: `204 NO CONTENT`

_Nothing_

### Errors:

| Status code | Error code | Description                                                                                          |
| ----------- | ---------- | ---------------------------------------------------------------------------------------------------- |
| 404         | 40401      | No record with the specified ID exists, or no note with the specified ID exists                                          |

### Example request:

```json
DELETE /api/v1/records/1/notes/1/
Accept: application/json
Authorization: Bearer <omitted>
```

</div>
