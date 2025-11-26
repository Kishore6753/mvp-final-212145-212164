# Career Platform Web Frontend – Documentation

## Overview
This documentation set covers the MVP Career Platform’s React-based frontend. It explains user journeys, component inventory, state management, accessibility, routing, API integration, and D3 graph approaches for role adjacency and competency coverage.

## Contents
- architecture.md — High-level system view (FE perspective), data flow, auth
- apis-frontend-backend.md — Consumed REST APIs, auth, schemas, examples
- modules-and-schema.md — Backend modules reference and DB schema cross-links
- frontend-components.md — Pages, components, routing, state, accessibility
- user-journeys.md — Primary and alternative flows mapped to screens
- d3-graphs.md — D3 graph model and rendering details (adjacency, coverage)
- data-ingestion-from-excel.md — How UI reflects canonical data from imports
- security-and-compliance.md — JWT use, RBAC, PII considerations on the client
- testing-strategy.md — Component/integration testing approach
- operations-and-env.md — Runtime configuration and API base URL
- acceptance-criteria.md — UI-focused MVP readiness checklist
- appendices.md — API endpoint references and sample payloads

## Related Containers
- CareerPlatformBackendAPI (FastAPI): service APIs and business logic
- CareerPlatformDatabase (PostgreSQL): canonical data and traceability

## Source References
- src/App.js, src/index.js, src/App.css
- package.json

