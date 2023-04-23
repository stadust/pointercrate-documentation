<div class='panel fade js-scroll-anim' data-anim='fade'>

# Player claims{id=player-claim}

Represents

| Field            | Type    | Description |
| ---------------- | ------- | ----------- |
| user_id          | integer | Id of user that owns the claim |
| player_id        | integer | Id of player that claim was assigned to |
| verified         | boolean | If the claim is verified by a Moderator |
| lock_submissions | boolean | User claiming the player has locked record submissions, requiring authentication on submissions for this player |

## Example objects

```json
{
  "user_id": 12,
  "player_id": 363,
  "verified": true,
  "lock_submissions": false
}
```

</div>
