# Matching and Retrieval Rules

## 1. Plan from the request

Identify the requested content type, explicit identifiers, constraints, and the
evidence needed to answer. Record each specification as an attribute, comparison
operator, and normalized value. An unqualified number means equality; "at least"
and "up to" mean lower and upper bounds. Preserve exact part-number suffixes.

Normalize harmless differences such as case, whitespace, HTML entities, unit
spellings, and verified equivalent facet values. Preserve original catalog values
when reporting. Do not equate physically different quantities: rows, columns,
pairs, contacts, bits, and bytes remain distinct. Do not infer a family, pitch,
gender, orientation, stock status, document type, or other restriction the user did
not supply. Resolve material ambiguity with one targeted question or state the
interpretation and separate conditional results. Follow-ups retain the original
requirements unless the user changes them.

## 2. Construct queries

Discover the current tool schema and verify any filter values before calling a
search tool. Use one query variation per call, start at `page: 0`, request
`hitsPerPage: 100` when supported, and keep all parameters except `page` fixed
during pagination. Retain all attributes needed for verification.

- Specification search: use an empty query with supported, verified filters that
  preserve every allowed match. Check unfilterable constraints locally. If blank
  queries are unsupported, text searches are exploratory, not exhaustive.
- Exact part or family lookup: query the identifier or family the user supplied.
  Verify identity against record-level fields; a fuzzy hit is not an exact match.
- Document search: query the stated part, family, document title, or topic. Apply
  a document-type filter only when requested and supported. Verify that each
  document applies to the requested part or family.
- Category, blog, page, or application search: query the stated category or topic.
  Keyword results may miss relevant wording; do not claim catalog-wide coverage
  from a text query.
- Comparison or compatibility: retrieve each named product and the applicable
  technical documents. Verify the same requested dimensions for each part.

Use AND across different required attributes. Use OR within one attribute only
for explicit alternatives or verified equivalent values. Do not apply an equality
filter to a range request or a narrow value that excludes an allowed variant. A
generic press-fit requirement permits plain and hybrid press-fit/compression;
"press-fit-only" excludes hybrid termination. Disclose the exact catalog value.

Use one UUIDv4 `sessionId` per conversation when supported. Put the actual user
message in `originalQuery` and describe the retrieval plan accurately in
`userIntent`. These fields are analytics metadata, not matching controls.

## 3. Retrieve and reconcile

Fetch every accessible page of each planned query. Track stable query parameters,
pages read, reported candidate totals, and distinct records. Reconcile totals and
deduplicate overlapping pages by `(indexName, objectID)`; do not merge different
records by similar names or across indexes.

Read complete tool output, including overflow files for truncated responses.
Check pagination caps, approximate or changing totals, partial failures, and
repeated pages. Stop when the service reports exhaustion or no progress is
possible, and disclose incomplete retrieval. Complete pagination establishes
coverage of that query, not every potentially relevant keyword in the catalog.

## 4. Verify each candidate

Check every explicit requirement against every candidate, including requirements
already used as filters. Prefer part-specific structured fields over a family
name or marketing claim. For each requirement, record PASS, FAIL, or UNKNOWN:

- **Verified:** all requirements pass.
- **Conditional:** none fail, but at least one is unknown or contradictory.
- **Nonmatch:** at least one fails.

Missing values are unknown, not matches. Resolve conflicting attributes with
applicable manufacturer documentation when available; otherwise flag the conflict.
For documents and content, verify requested identity, type, relevance, and any
technical claim the answer relies on. A keyword mention alone does not establish
document applicability. Do not infer mating or interchangeability from shared
family, pitch, or dimensions without manufacturer evidence.

## Final check

Confirm correct routing, no inferred restrictions, stable pagination, full output
read, every requirement verified, counts reconciled, all verified records included,
and uncertainties and coverage limits stated. If a repeat search changes results,
explain a supported cause or say the cause is unknown; do not reuse historical
counts as current evidence.
