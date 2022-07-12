<div class='panel fade js-scroll-anim' data-anim='fade'>

# Nationality objects{id=nationality}

Object representing some nation

| Field        | Type   | Description                                                     |
| ------------ | ------ | --------------------------------------------------------------- |
| nation       | string | The nation's name                                               |
| country_code | string | The nation's ISO country code. Always exactly 2 characters long |
| subdivision | Subdivision? | An optional entry specifying a state within the country | 

## Subdivision objects 

Object representing some state with in a nation

| Field        | Type   | Description                                                     |
| ------------ | ------ | --------------------------------------------------------------- |
| name       | string | The states's name                                               |
| iso_code | string | The nation's ISO country code. Not always 2 characters long (e.g. for Australia's subdivisions it's three) |


## Example object

```json
{
  "nation": "United States",
  "country_code": "US",
  "subdivision": {
    "iso_code": "OH",
    "name": "Ohio"
  }
}
```

</div>
