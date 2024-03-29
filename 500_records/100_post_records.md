<div class='panel fade js-scroll-anim' data-anim='fade'>

# Submitting Records

## `POST`{.verb} `/records/`

<div class='info-yellow'>
<b>Rate Limits:</b><br>
This endpoint is ratelimited at 3 successfully submitted records per 20 minutes per submitter and 20 records per hour globally. Further there are only 5 new IP adresses allowed to make submissions per hour (this limit is only relevant for your first time submitting a record).
</div>

<div class='info-yellow'>
<b>Access Restrictions:</b><br>
Unless you set `status` to `SUBMITTED` (or omit the field), access to this endpoint requires at least `LIST_HELPER` permissions. The `raw_footage` field is required unless the submitter has at least `LIST_HELPER` permissions.
</div>

Either adds a record directly to the list, or submits a record to the list mods for approval. The record must meet the demons requirement, and the holder in question needn't be banned.

The `video` value, if provided, must meet the requirements specified [here](/documentation/#video).

### Request:

| Header       | Expected Value     | Optional |
| ------------ | ------------------ | -------- |
| Content-Type | `application/json` | false    |

| Field    | Type                                                  | Description                                                      | Optional |
| -------- | ----------------------------------------------------- | ---------------------------------------------------------------- | -------- |
| progress | integer                                               | The records progress                                             | false    |
| player   | string                                                | The name of the player holding the record                        | false    |
| demon    | integer                                               | The id of the demon the record is made on                      | false    |
| note | string | Submitter-written note for the record.  | true |
| video    | URL                                                   | The video of the record                                          | true     |
| raw_footage | URL | Raw footage of the record, can be any URL. Becomes one of the first notes of the record.  | true |
| status   | [RecordStatus](/documentation/objects/#record-status) | The status the newly record should have, defaults to `SUBMITTED` | true     |

### Response: `200 OK`

Note how we do not use `201 CREATED` here as the submission of the record is not guaranteed: Some validity checks are deferred and might result in the submission being auto-deleted after the `200 OK` response was sent.

| Header       | Value                                            |
| ------------ | ------------------------------------------------ |
| Content-Type | `application/json`                               |
| Location     | The location of the newly created record         |
| ETag         | unsigned 64 bit hash of the newly created record |

| Field | Type                                     | Description                     |
| ----- | ---------------------------------------- | ------------------------------- |
| data  | [Record](/documentation/objects/#record) | The newly created record object |

### Errors:

| Status code | Error code | Description                                                             |
| ----------- | ---------- | ----------------------------------------------------------------------- |
| 403         | 40304      | You have been banned from submitting records                            |
| 403         | 40308      | You are not authorized to submit a record for this player |
| 404         | 40401      | The provided demon does not exist                                       |
| 422         | 42218      | The record holder is banned                                             |
| 422         | 42219      | The demon is on the legacy list                                         |
| 422         | 42215      | The record does not meet the demons requirement                         |
| 422         | 42220      | The demon is on the extended list but the record's progress isn't `100` |
| 422         | 42217      | The record has already been approved/rejected/submitted/approved        |
| 422         | 42232      | A record without raw footage was submitted |
| 422         | 42233      | Provided raw footage was not a valid URL |

### Example request:

```json
POST /api/v1/records/
Accept: application/json
Content-Type: application/json

{
    "progress": 79,
    "player": "stadust",
    "demon": 70
}
```

</div>
