# Hot-FV

This repository contains the open source implementation of Hot-FV.

## How to Run

To execute Hot-FV, use the following commands:

```bash
WITHOUT_IMD=0 BATCH=1 make RocketTile_Small
WITHOUT_IMD=0 BATCH=1 make RocketTile_Tiny
WITHOUT_IMD=0 BATCH=1 make or1200
WITHOUT_IMD=0 BATCH=1 make b12
```

Results will be saved in `benchmark/[target]/result_[BATCH]`.

Our results are available in `benchmark/[target]/[exp_with_warm or exp_without_warm]`.

## Folder Structure Explanation

Within the target directory of `benchmark`:

- `cfg.pkl`: Contains the parsed control flow graph of the design.
- `idx.txt`: Maps the corresponding `id` to the target branch id.

Within the `exp_` folder in the target of `benchmark`:

- `id`: Contains the Pono result for each branch.
- `last_state_value.txt`: Contains the warm starting state for test generation for other branches.
- `memory.txt`: Contains memory results.
- `result.txt`: Shows branch coverage of our experiment (excluding `reset` related branches).
- `unknown.txt` and `unreachable.txt`: Indicate unknown and unreachable targets.
- `score.txt`: Logs the running process, including warm state selection.

The JasperGold results are located in `exp/jg`. You can refer to `jg.log` for logs in different targets.