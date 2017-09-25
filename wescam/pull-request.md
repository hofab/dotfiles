| Checklist |   | ________________________________________________Review_Items________________________________________________ |
|-----------|---|--------------------------------------------------------------------------------------------------------------|
|     Y     | 1 | Critical items and/or key characteristics have been addressed with unit tests, integration tests, or a thorough review. |
|           | 2 | All the referenced documents have been identified in the file header. |
|           | 3 | Doxygen comment blocks are used for function headers and the file header. |
|           | 4 | All functions and variables private to the file have been declared static. |
|           | 5 | Command handlers (and called functions) are non-blocking. |
|           | 6 | Task stack sizes are sufficient. |
|           | 7 | Maintenance tables and fields are logically grouped. |
|           | 8 | Members of dbfd_t are size typed, not enums (e.g. int32_t). |
|           | 9 | Module modes have been implemented appropriately. |
|           | 10| Variables are declared constant where appropriate. |
|           | 11| Global variables and memory mapped registers are declared volatile where appropriate. |
|           | 12| Race conditions have been identified. |
|           | 13| Bounds checking (e.g. buffer overflow) have been implemented. |
|           | 14| Task and mutex locks are paired with respective unlocks. |
|           | 15| Core logic is handled in tasks as opposed to command handlers and menu routines. |
|           | 16| Error log flooding checks have been implemented where appropriate. |
