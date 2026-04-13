# Journal Control

## Timestamps of Journallog in UTC
`TZ=UTC journalctl --file=system@ed3403dd9bc741caa6025d69f47dd885-000000000012ae7f-0006464dcd4d1cc8.journal --header`

Note: `--utc` does not work we have to use `TZ=UTC` to get it in UTC.

Example
```
File path: system@ed3403dd9bc741caa6025d69f47dd885-000000000012ae7f-0006464dcd4d1cc8.journal
File ID: 7560df7f8e5e4998a2e847705bb874a9
Machine ID: be2a1044083f478095a9d2e7f5d7805b
Boot ID: c1332635b35847a88a7d2bdc30d4f935
Sequential number ID: ed3403dd9bc741caa6025d69f47dd885
State: ARCHIVED
Compatible flags:
Incompatible flags: COMPRESSED-XZ
Header size: 240
Arena size: 8388368
Data hash table size: 14563
Field hash table size: 333
Rotate suggested: yes
Head sequential number: 1224319 (12ae7f)
Tail sequential number: 1233804 (12d38c)
Head realtime timestamp: Fri 2025-12-19 13:10:31 UTC (6464dcd4d1cc8)
Tail realtime timestamp: Fri 2025-12-19 14:39:22 UTC (6464f0b0dbfab)
Tail monotonic timestamp: 1w 22h 22min 46.824s (9f930bcd28)
Objects: 19485
Entry objects: 9486
Data objects: 9587
Data hash table fill: 65.8%
Field objects: 33
Field hash table fill: 9.9%
Tag objects: 0
Entry array objects: 377
Disk usage: 6.7M`
```

## Look through all the logs for a certain module in fish shell
Globbing is sometimes a pain in fish so this is something that works to go through all the logs and look for a service
`ls system@*.journal | xargs -I {} journalctl --file={} --utc --output=short-iso -u <SERVICE_NAME>`
