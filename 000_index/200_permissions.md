<div class='panel fade js-scroll-anim' data-anim='fade'>

# Permissions

Different endpoints require different kinds of permissions to be used. Additionally, access to [user](/documentation/objects/#user) objects via the sub-endpoints of [`/users/`](documentation/users) is also governed by permissions. In particular, you can only access accounts of users who have permissions that *you can assign* (with the exception of people having `MODERATOR` privileges, who can access all user accounts).

If an endpoints requires special permissions to be accessed, it's documentation will contain a notice similar to this one:

<div class='info-yellow'>
<b>Access Restrictions:</b><br>
Access to this endpoint requires at least `LIST_HELPER` permissions.
</div>

A [user](/documentation/objects/#user)'s permissions are saved as a bitmask, and by default every user has no permissions.

### Available permissions

The following permissions exist. If a permissions `A` implies some other permission `B`, then a user with permission `A` can do everything a user with permission `B` can do, without needing to explicitly having the bit for permission `B` set. For example, a user with *only* the `LIST_MODERATOR` bit set also has all privileges that the `LIST_HELPER` bit grants. Note that implication of permissions in transitive, e.g. a user with *only* the `LIST_ADMINISTRATOR` bit set still has all privileges that the  `LIST_HELPER` bit grants, since `LIST_ADMINISTRATOR` implies `LIST_MODERATOR`, which implies `LIST_HELPER`.

If a permission `A` assigns some other permission `B` then a user with permission `A` can modify the bit for permission `B` via [`PATCH /users/user_id/`](/documentation/users/#patch-user) of users he has access to. 

| Permission           | Bit    | Description                                                                                                                                            | Implies | Assigns |
| -------------------- | ------ | ------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `LIST_HELPER`        | 0x2    | Users that help out in managing the demonlist by reviewing records                                                                                     | None | None |
| `LIST_MODERATOR`     | 0x4    | Users that moderate the demonlist and manage the demon placements                                                                                      | `LIST_HELPER` | None |
| `LIST_ADMINISTRATOR` | 0x8    | Users that administrate the demonlist | `LIST_MODERATOR` | `LIST_HELPER`, `LIST_MODERATOR` |
| `MODERATOR`          | 0x2000 | Users that have access to the pointercrate user list                                                                                                   | None | None |
| `ADMINISTRATOR`      | 0x4000 | Users that can manage other users, including granting them permissions                                                                                 | `MODERATOR` | `LIST_ADMINISTRATOR`, `LIST_HELPER` |

### Errors

These error conditions can occur at any endpoint expecting requiring specific access permissions and are thus not listed specifically for each of them.

| Status code | Error code | Description                                                      | Data                                                                                  |
| ----------- | ---------- | ---------------------------------------------------------------- | ------------------------------------------------------------------------------------- |
| 403         | 40301      | You do not have the permissions required to perform this request | `required`: A list of permission-bitmasks that would allow you to perform the request |

</div>
