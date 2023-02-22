<div class='panel fade js-scroll-anim' data-anim='fade' style="position: relative">

# List demon audit entries

## `GET`{.verb} `/v2/demons/` `id`{.param} `/audit`

<div class='info-yellow'>
<b>Access Restrictions:</b><br>
Access to this endpoint requires at least `LIST_ADMINISTRATOR` permissions.
</div>

Retrieves a detailed list of the changes for a demon with the given `id`.

### Request:

| Header        | Expected Value                                                                            | Optional |
| ------------- | ----------------------------------------------------------------------------------------- | -------- |
| Content-Type  | `application/json`                                                            | false    |
| Authorization | [Pointercrate access token](/documentation/#access-tokens)                                | false    |

### Response: `200 OK`

| Header       | Value              |
| ------------ | ------------------ |
| Content-Type | `application/json` |

| Field | Type                                                           | Description      |
| ----- | -------------------------------------------------------------- | ---------------- |
| -     | List[[AuditLogEntry](/documentation/objects/#audit-log-entry)] | A list of movement log entries containing the modified demon's data |

### Example request:

```json
GET /api/v2/demons/1/audit
Accept: application/json
Authorization: Bearer <omitted>
```

</div>
