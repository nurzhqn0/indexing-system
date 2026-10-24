# Intelligent System for Indexing Academic Journals (КОКСНВО МНВО РК)

Diploma project, group SE-2421. A web system for searching the list of scientific journals recommended by the Science and Higher Education Quality Assurance Committee of the Ministry of Science and Higher Education of Kazakhstan: hybrid search (full-text, fuzzy and semantic, fused by Reciprocal Rank Fusion), a recommended-status check and a versioned registry.

RU: Разработка интеллектуальной системы индексации научных журналов, рекомендованных Комитетом по обеспечению качества в сфере науки и высшего образования МНВО РК.
KZ: ҚР Ғылым және жоғары білім министрлігінің сапаны қамтамасыз ету комитеті ұсынған ғылыми журналдарды индекстеуге арналған интеллектуалды жүйе.

## Problem, users, outcomes
- **Problem:** researchers and doctoral students must check whether a journal is in the Committee's list and at which level. The list is published as documents that are hard to search, changes regularly (three levels since the order of 3 June 2025), and journal titles occur in Kazakh, Russian and English with typos and transliteration.
- **Target users:** researchers, teachers and PhD students; librarians and dissertation-council staff; journal editors; analysts (secondary). User needs are assumptions until the user discussions in report section 2 are done.
- **Expected outcomes:** deployed web service with documented API; versioned registry with repeatable import; Vue client with search, filters, journal cards and status check; evaluation report comparing hybrid retrieval with full-text, fuzzy and vector search alone.

## Team
| Name | Role |
|---|---|
| Nurzhan Izimbetov | Backend & Search Core Engineer: architecture, database, FastAPI, hybrid search, performance, deployment |
| Abilkhaiyr Sarsenbay | Frontend & Data Integration Engineer: Vue client, user scenarios, registry data preparation and synchronisation |
| Symbat Nurgaliyeva, PhD | Supervisor |

## Scope and status
In scope: the Committee list (243 rows in the edition of 15 Sep 2026, imported whole), with a focus on the **IT and computer-science subset of 15 journals**; search by title, ISSN and topic in kk/ru/en, filters, status check, versioned import, Docker deployment. Out of scope: official decisions, authentication, article-level indexing. Open scope questions are listed in report section 1.

Status (23 Oct 2026): analysis and design package done (`docs/REPORT.md`). A journal-level enrichment prototype (`integration/enrichment/`) works for one journal of the IT/CS subset. Registry import, backend, search core, client and evaluation are not started. Pending: user survey and discussions (report section 2.4), supervisor feedback on the report, YouTrack project.

## Technologies
Selected for the core: Python, FastAPI, PostgreSQL with full-text search, `pg_trgm` and `pgvector`, multilingual embedding model (BGE M3 or multilingual E5, to be decided by measurement), Vue 3, Node.js scripts for data integration, Docker. Alternatives and reasons: report section 5.

## Links
- Report (all 11 required components, appendices): [docs/REPORT.md](docs/REPORT.md)
- User survey (Google Forms): https://docs.google.com/forms/d/e/1FAIpQLScFAFdqwJFGHOFftV6nI4vmFLz6PFovjTx-XXTA9Z2oMPNAMA/viewform
- YouTrack project (DIP): https://indexing-system.youtrack.cloud/projects/DIP; task list in report appendix D
- Diagrams (editable Mermaid): [diagrams/](diagrams/) (`context.mmd`, `usecase.mmd`, `component.mmd`, `erd_registry.mermaid`)
- UI mockups (HTML sources, `bash diagrams/mockups/render.sh` re-renders PNG into `diagrams/exports/`): [diagrams/mockups/](diagrams/mockups/)
- Bibliography: [docs/lit/references.bib](docs/lit/references.bib)

## Repository layout
```
docs/           REPORT.md, lit/references.bib
diagrams/       Mermaid sources and SVG exports
backend/        planned: FastAPI, search core, migrations
frontend/       planned: Vue client
integration/    enrichment/ started (Node.js, ISSN/language/website from OJS OAI-PMH); planned: registry import scripts and JSON schema
evaluation/     planned: query set and metrics harness
deploy/         planned: Docker Compose
```

## Setup, run, test
Core system: not runnable yet. Instructions will be added with the first runnable code (`docker compose up`, test commands).

Enrichment prototype (Node.js 20+), see [integration/enrichment/README.md](integration/enrichment/README.md):
```
cd integration/enrichment
npm ci
npm test                      # offline tests
npm run enrich -- --only 85   # live: 2 requests to the Astana IT University journal
```


## Working rules
Commits go straight to `main` as `DIP-<n>: <message>`, each from the author's own account; tags `pre-defense-1`, `pre-defense-2`, `final-pre-defense`. No secrets or personal data in the repository; configuration examples use placeholder values.

## Pre-defense tags
Each submission is an annotated tag on `main`, created once and never moved or deleted (protected by a repository ruleset):

| Tag | Stage | Submission notes |
|---|---|---|
| `pre-defense-1` | Pre-defense 1, 24 Oct 2026 | repository link, tag, completed work, known limitations, outstanding tasks |
| `pre-defense-2` | Pre-defense 2 | same |
| `final-pre-defense` | Final pre-defense | same |


