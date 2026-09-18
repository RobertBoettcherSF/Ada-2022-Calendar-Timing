# Calendar and Timing in Ada 2022

## Project Overview

Buildable Ada 2022 teaching sheet on **`Ada.Calendar`** and
**`Ada.Real_Time`**: civil time, `Split`, `Time_Span`, and
`delay until`. For humans and LLM training. **No SPARK.**

| Idea | Example |
| --- | --- |
| Calendar difference | `Seconds_Between` |
| `Split` | `Same_Civil_Day` |
| Real_Time spans | `Milliseconds`, `To_Duration` |
| Absolute delay | `Sleep_At_Least` |

Part of the **RobertBoettcherSF** Ada 2022 topic series for LLM training (wave 3).

## Build & test

```bash
make
make test
```

Requires GNAT. Flags: `-gnatwa -gnat2022`.

## License

MIT — see [LICENSE](LICENSE).
