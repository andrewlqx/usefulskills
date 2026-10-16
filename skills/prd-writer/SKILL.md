---
name: prd-writer
description: Draft or refine a lean 1-2 page PRD (or similar product/requirements doc, change request write-up), ready to paste into Confluence. Use when asked to write, restructure or tighten a PRD, CR or requirements write-up.
---

# Lean PRD writer

Write PRDs that are 1-2 pages max, main point first, and easy to paste into Confluence. The PRD covers WHAT and WHY. HOW (architecture, services, async jobs, trigger timing, epics) goes in a separate RFC, linked at the end.

## Working style (follow every time)

1. **Intake first** (see Intake below). Check what the user already gave against the Brief template. If most of it is there, go straight to the draft. If it's thin, run the guided intake. If the user says "just draft", draft immediately with `[TBC]` placeholders. Never invent numbers, metrics or decisions.
2. **Print the PRD as normal formatted text in chat first** (headings, bold, tables). No code block until the user asks for the copy-ready version.
3. **Iterate.** On each change, apply it everywhere it ripples (title, TL;DR, scope matrix, requirements, decisions, non-goals) so nothing contradicts. Renumber IDs and fix cross-references (e.g. "see D-2"). Say in one short line what else changed and why.
4. **Reprint the whole PRD after every change**, as normal formatted text, so the user can read the latest version in one place and move on. Put one or two short lines above it saying what changed, and at most one short note below it if something needs the user's attention.
5. **Final delivery for Confluence (Markdown paste often fails):**
   - Primary: an HTML file (simple bordered tables, bold group rows, status/owner table at the top) the user opens in a browser, then Ctrl+A, Ctrl+C, paste into Confluence.
   - Backup: Confluence wiki markup in a code block (`h1.`, `h2.`, `*bold*`, `* bullet`, `||header||`, `|cell|`, group row `|*Group*| | |`, header table rows `||Status|Drafting / Review|`). Escape every square bracket as `\[` `\]` so placeholders don't become links. Paste via Insert -> Markup -> Confluence wiki.
   - Markdown code block only if the user says their Confluence accepts it.
6. Keep a saved .md copy in the outputs folder and keep it in sync with every change.

## Intake

### When the skill starts with a thin request

Open with one short message offering two ways in, then wait:

> To write a sharp PRD I need a few details. Either **paste the brief below** (fill what you know, write "not sure" for the rest), or **say "ask me"** and I'll walk you through a few quick questions.

Then show the Brief template in a code block so it can be copied.

### Brief template (copyable)

```
PRD-000NN: [working title]
Owner(s): [name]
Goal (1 line): [what we're building, for whom]
Users: primary = [ ], secondary = [ ]
Scope in: [ ]   Scope out: [ ]   Out-of-scope items get: [e.g. standard view]
Problem today: [current process or system limitation + 1 concrete example]
Evidence: [time per item, volume/year, errors, audit finding - or "none yet"]
Success looks like: [number / adoption / survey / governance-control - say which]
Screens/systems affected: [old view, new view, ERP or other external system, backend...]
Requirements I already know: [per role/screen: mandatory fields, defaults, option lists, block vs warn]
Already exists today (don't re-spec): [e.g. line-item locking, an existing system check]
Decided: [ ]   Still open: [ ]
Leave to RFC: [technical items to keep out of the PRD]
```

### Guided intake (when the user says "ask me")

- Ask in **rounds of up to 4 questions**, max 3 rounds. Skip anything already answered.
- Use the AskUserQuestion tool when available. Give multiple-choice options where answers fall into natural buckets, and let the user type their own answer. Every question accepts "Not sure", which becomes `[TBC]` plus an open-question row.
- After the last round, draft the PRD straight away. Don't recap the answers first.

**Round 1 - the core**
1. What are we building, and who benefits most? (primary + any secondary users)
2. What's the problem today? Give one real example of it going wrong.
3. Any numbers? (time per item, volume per year, errors found) Options: I have numbers / Rough estimates / None yet
4. What's in scope, and what's explicitly out?

**Round 2 - the shape**
1. Which screens or systems change? Options: Old view only / New view only / Both / Backend or external system (e.g. ERP)
2. What already exists that must stay or that this builds on? (existing checks, locking, legacy buttons)
3. How will you know it worked? Options: Time saved / Adoption / User survey / Governance or control in place
4. Any rules you already know? (mandatory fields, defaults, option lists, should a warning block or only warn)

**Round 3 - only if gaps remain**
1. What's already decided, and what's still open?
2. Anything technical to leave to the RFC?
3. PRD number, title and owner(s)?

### Brief checklist (what a good draft needs)

1. Title / PRD number and owner(s)
2. One-line goal; primary and secondary beneficiaries
3. Scope in / out, and what out-of-scope items get instead
4. Today's problem + evidence (time per item, volume/year, errors, existing system limitation, a concrete example)
5. What success looks like and which kind (number, adoption, survey, governance)
6. Screens/systems affected (old vs new UI, backend, external systems)
7. Known requirements per role/screen: mandatory fields, defaults, option lists, block vs warn
8. What already exists and must stay (legacy actions, existing checks, existing features)
9. Decisions made and questions still open
10. Anything to leave to the RFC

## Template (sections in this order)

```
# PRD-000NN: <Title that says what changes vs today, e.g. "Duplicate flagging beyond <existing system>'s check">

| Status | Drafting / Review |
|---|---|
| Owner(s) | @<name> |

## TL;DR
**Goal:** <what is built + main beneficiary + main benefit>. <If others benefit: "It also helps <group>, who <benefit>, and gives <group> <benefit>.">
**Scope:** <what's in, AND what out-of-scope items get instead (e.g. "all other requests show standard details"); what legacy stays; pending items marked (to be confirmed, D-n)>
**Success:**
- **<Primary user>:** <checkable outcome>
- **<Secondary user>:** <checkable outcome>   (only if they truly benefit)

## Problem & why now
<= 5 sentences: today's limitation/pain + evidence + how this change closes the gap.

## Goals / Non-goals
**Goals** - one bullet per user group, <= 3
**Non-goals** - things a reader could reasonably assume are in scope but are not

## Scope matrix   (only if more than one screen/system/role changes; one row is fine)
| Screen | <Old view (tech)> | <New view (tech)> | Backend |

## Requirements
| ID | Requirement | Acceptance criteria |
| **<Group: screen/role + which view, e.g. Submitter form (old view)>** | | |
| FR-1.1 | <who can do what> | <testable: mandatory?, default, options, shown/hidden, blocks or warns> |

## Decisions & key risk
| # | Item | Decision / answer |
| D-1 | <question> | **<answer>** or [To confirm with users] |
| R-1 | <risk> | **Mitigation:** <one line> |

**RFC:** <insert link to RFC here>
```

The Status / Owner(s) table always sits at the top, directly under the title. Status values: Drafting / Review, Approved, Obsolete. Add rows (e.g. Approvers, Links) only if the user asks.

## Writing rules

**Length & cutting**
- 1 page ideal, 2 max. If longer, split into phases or a second PRD.
- Remove-it test: if a reviewer could make the same decision without a line or section, cut it. Each fact appears once.
- TL;DR is written last and must stand alone.

**Goal & beneficiaries**
- Name the primary beneficiary first; secondary users in one trailing sentence. Mirror this order in Success and Goals.
- Use the organisation's own role names consistently (e.g. Submitter, Reviewer, Approver); define any acronym once.

**Problem**
- Quantify when possible: time per item x volume per year = hours per year (e.g. "up to 30 min per request x ~[X,000] requests = ~[Y,000] reviewer hours"). Use bracketed placeholders for numbers not yet known.
- If an existing system check exists, state exactly what it checks and how it's bypassed (e.g. "the ERP flags only when all 4 fields match; change any one and it bypasses"), plus one concrete example (INV-001 -> INV-001-A).
- Cover accuracy/risk as well as time if relevant (errors slip through manual checks).
- Don't claim pain that existing features already solve; check with the user.

**Success criteria** (don't have to be numeric; must be honest and checkable)
- Mix types per user group: adoption ("reviewers choose the new view over manual checking"), rough time target ("~50% less review time"), counts ("3 fewer form fields"), outcome ("fewer requests sent back for correction"), pilot survey (">= [70]% of pilot users say..."), or a governance/control outcome ("every potential duplicate is shown to the reviewer before approval").
- For governance/advisory features, don't force accuracy metrics that are hard to measure; frame success as the control reliably reaching the user. One success line is fine; don't pad with a repetitive second one.
- Never fabricate baselines; no measurement-method notes unless asked.

**Non-goals**
- Must pass: would someone plausibly assume it's in scope?
- Typical ones: the feature for out-of-scope categories; replacing the legacy view/system check ("it stays as is"); showing advisory flags to users who'd be deterred by false positives; auto-blocking/approving; edge cases deferred to a later phase.
- Phrase AI/automation limits plainly and never in a way that could be misread as the opposite: "The AI does not approve or reject requests. It gives a first-cut assessment, and reviewers make the final judgement."

**Requirements**
- One table, grouped by screen/role with bold group rows; tag each group with the view it lives in (old view / new view).
- Acceptance criteria must be testable. Spell out option lists with a count ("6 options: ..."), defaults, mandatory/optional, and whether a warning blocks or only warns.
- Keep matching/business rules in one row where possible (e.g. amount + vendor ID + document type together), not split across rows.
- Existing features: don't re-spec as new. Say "as in the old view today" or "uses the existing <feature name> feature".
- Dual UIs (old + new): keep legacy actions ("No existing action removed or changed") and state sync ("Locks set in either view are shown in both"; "status shown in both views").
- AI/automated checks: show the reason with every result (Pass / Fail / Not Applicable + reason); re-run only on changed/unlocked items; say which item types get the AI assessment and which don't.
- Reminders vs declarations: if the user wants a nudge, write "shows a reminder [exact message to be confirmed]; user can go back or continue; no declaration or reason needed". Don't hard-code UI copy the user hasn't confirmed.
- Advisory checks for reviewers should not run in front of submitters if false positives would deter genuine submissions; state only that results are ready when the reviewer opens the item.
- Leave HOW to the RFC: when/how a check runs, services, queues, performance. State only the user-facing need ("results ready when the reviewer opens the request").
- Avoid P0/P1 labels; use phases if priority differs.

**Decisions & key risk**
- Columns: #, Item, Decision/answer only (no Owner/Date). Call it "Open questions" while unanswered; rename to "Decisions & key risk" once answered (IDs D-n).
- When a decision is made, also update the requirement it affects (e.g. D-2 answer appears in FR-1.4's acceptance criteria). Drop D-rows that only restate a requirement.
- Keep 1 key risk when the feature involves AI or advisory flags (wrong results trusted / too many flags) with a one-line response. Engineering risks go to the RFC.
- Pending items: mark `[to be confirmed]` inline + a D-row, and make sure TL;DR, scope and non-goals don't state them as fact.

**Other**
- Workflow section: skip by default. Add a 4-5 step user flow only if roles hand off or there's a branch/loop the requirements don't make obvious.
- Naming: define UI/system names once ("new view (React)", "old view (legacy)") then use them consistently; keep real on-screen button labels exactly as they appear.
- Plain words, short sentences, no filler, no emoji.

## Worked example (fictional; match this level of brevity)

```
# PRD-00001: Duplicate invoice flagging beyond the ERP's exact-match check

| Status | Drafting / Review |
|---|---|
| Owner(s) | @Jane Doe |

## TL;DR
**Goal:** Acme Procure flags a submitted invoice as a **potential duplicate** when an existing invoice has the same vendor and the same total amount, so reviewers can catch double payments before approval.
**Scope:** All invoices in Acme Procure from the current and previous financial year (to be confirmed, D-1). Whether goods invoices are checked only against goods invoices, and service invoices only against service invoices, is to be confirmed with users (D-3).
**Success:**
- **Reviewer:** Every invoice with a potential duplicate is shown to the reviewer, with the matched invoices, before they approve it. Reviewers no longer rely on memory or manual searches, and get a reminder before they click Approve.

## Problem & why now
The ERP's duplicate check only flags an invoice when all four fields match exactly: invoice number, invoice date, total amount and vendor. If any one of them changes, the invoice bypasses the check. For example, a resubmitted invoice may carry an extra suffix (INV-001 becomes INV-001-A). To fill the gap, reviewers search past records manually and rely on memory, which is slow, varies by reviewer and still misses duplicates. This change closes the gap by matching on vendor and amount, so a changed invoice number or date no longer hides a duplicate.

## Goals / Non-goals
**Goals**
- **Reviewer:** Potential duplicates are flagged automatically, with the matching invoices shown side by side for a quick decision.
- **Finance:** Duplicate payments are caught before approval, not after payment.

**Non-goals**
- Replacing the ERP's duplicate check; it stays as is.
- Showing duplicate flags to submitters. The flag is for reviewers only, so false positives don't deter genuine submissions.
- Blocking or auto-rejecting invoices. The flag is advisory; the reviewer makes the final judgement.
- Catching duplicates with a different amount (e.g. split or partial invoices) in this phase.

## Scope matrix
| Screen | What changes | Backend |
|---|---|---|
| Reviewer view | List of potential duplicate invoices shown when the reviewer opens the invoice; reminder before they Approve | Matching service checks invoices from the current and previous financial year; flag saved with the invoice |

## Requirements
| ID | Requirement | Acceptance criteria |
|---|---|---|
| **Duplicate check** | | |
| FR-1.1 | Duplicate check results are ready when the reviewer opens the invoice | Flag and matched invoices show without the reviewer waiting; when and how the check runs is decided in the RFC |
| FR-1.2 | Flag when the invoice total **and** the vendor ID both match exactly | Exact amount, exact vendor ID and same invoice type (goods vs goods, services vs services) [invoice type rule to confirm with users] |
| FR-1.3 | Check against invoices from the current and previous financial year | Older invoices are not matched [range to be confirmed, D-1] |
| FR-1.4 | Exclude invoices that shouldn't count as duplicates | Deleted and draft invoices are not matched |
| **Reviewer view** | | |
| FR-2.1 | Show the list of invoices flagged as potential duplicates | Each shows the document number, description, submission date and a document link |
| FR-2.2 | Remind the reviewer about potential duplicates when they click Approve | On a flagged invoice, clicking Approve shows a reminder that potential duplicates exist [exact message to be confirmed]; reviewer can go back or continue; no declaration or reason needed |

## Decisions & key risk
| # | Item | Decision / answer |
|---|---|---|
| D-1 | Which financial years are checked? | **Current and previous year** [to be confirmed] |
| D-2 | Match on invoice total, line-item amount, or both? | **Invoice total.** |
| D-3 | Should matching be limited to the same invoice type? | [To confirm with users] |
| R-1 | The check raises too many potential duplicates. | **Likely, depending on the nature and date of the invoice** (e.g. recurring monthly payments of the same amount to the same vendor). The reviewer checks the matched records and sieves out the true duplicates. |

**RFC:** ____________________
```

## Companion docs

- **RFC / tech design (2-5 pages):** Header (status, author, approvers, linked PRD) · Overview · Background (link PRD, don't repeat) · Proposed design (context diagram, components & boundaries, APIs/data, async processing, workflow) · Alternatives considered · Cross-cutting (security, privacy, audit, performance) · Rollout & testing · Risks & open questions · Implementation plan (epics -> Jira).
- **Decision record (<= 1 page)** for small changes: Context · Decision · Consequences.
