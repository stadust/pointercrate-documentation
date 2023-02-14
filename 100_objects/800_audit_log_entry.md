<div class='panel fade js-scroll-anim' data-anim='fade'>

# Audit log entry{id=audit-log-entry}

Represents some user-initiated mutation event for an object.

| Field        | Type                 | Description |
| ------------ | -------------------- | ----------- |
| time         | string               | Date and time of the movement in ISO 8601 format |
| entry_id     | number               | The ID associated with this audit log entry |
| id           | number               | The ID of the object being modified in this entry |
| user         | [NamedId](#named-id) | Identifier of user that made the change |
| type         | AuditLogEntryType    | May contain a string or an object. See below. |

## Audit log entry

May be a string of "Addition" or "Deletion" or an object with key "Modification". What this object contains depends on the endpoint you are accessing.

All fields in this object contain null unless the audit log entry modifies this data.

### Demon modification data

| Field        | Type                  | Description |
| ------------ | --------------------- | ----------- |
| name         | string?               | Name of demon after modification |
| position     | number?               | Position of demon after modification |
| requirement  | string?               | Requirement of demon after modification |
| video        | number?               | Video of demon after modification |
| verifier     | [NamedId?](#named-id) | Identifier of verifier for demon after modification |
| published    | [NamedId?](#named-id) | Identifier of published for demon after modification |

## Example objects

### Demon audit log

```json
{
    "time": "2019-04-18T13:07:18.259877",
    "entry_id": 56,
    "id": 1,
    "user": {
        "id": 6,
        "name": null
    },
    "type": "Addition"
}
```

```json
{
    "time": "2020-07-20T14:35:52.365889",
    "entry_id": 11921,
    "id": 1,
    "user":{
        "id": 24,
        "name": "dog"
    },
    "type": {
        "Modification": {
            "name": null,
            "position": 35,
            "requirement": null,
            "video": null,
            "verifier": null,
            "publisher": null
        }
    }
}
```

</div>