# Index Routing

## Discover the deployment

Inspect available MCP servers, indexes, and live tool schemas before searching.
The configured catalog MCP uses these production indexes:

| Role | Index name |
| --- | --- |
| products | `global_prod_default_products` |
| categories | `global_prod_default_categories` |
| documents | `global_prod_default_documents` |
| blogs | `global_prod_default_blogs` |
| pages | `global_prod_default_pages` |

Use the exact index names when they are available through the live MCP. Map the
roles below to discovered indexes in another deployment. Do not assume test and
production catalogs have the same records. If a required index is unavailable,
report the missing coverage.

## Choose indexes by evidence needed

| Request | Primary index | Supporting index when needed |
| --- | --- | --- |
| Part number, specifications, family, product listing | products | documents for technical evidence |
| Datasheet, drawing, manual, certificate | documents | products to verify identity or linked documents |
| Category or taxonomy | categories | products for requested listings |
| Technical comparison or mating compatibility | products | documents |
| Blog, article, application guidance | blogs, pages | products or documents for technical claims |
| General product overview | products | pages or blogs for context |
| Explicit search across all content | products, categories, documents, blogs, pages | — |

For a combined request, use the union of relevant routes. Search primary indexes
first, then supporting indexes to resolve specific evidence gaps. Keep each index's
records and counts separate.

## Check capabilities at search time

Use only parameters and filters accepted by the live search tool. Verify exact
facet values through the schema, returned records, or facet-value discovery before
filtering. A discoverable facet does not necessarily correspond to an accepted
search filter. Check unsupported requirements against retrieved records instead of
inventing tool parameters. Do not assume one index has another index's filters.

## Respect evidence boundaries

Products establish catalog identity and record-level attributes. Documents support
technical claims when their applicability to the part or family is verified.
Categories establish taxonomy. Blogs and pages provide context, but do not by
themselves prove specifications or mating compatibility. A search snippet does not
prove the contents of a document that has not been read.
