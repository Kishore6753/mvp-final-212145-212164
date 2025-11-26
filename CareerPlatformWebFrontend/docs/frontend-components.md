# Frontend Components

## Overview
The MVP frontend is a lightweight React application that orchestrates role selection, competency assessment, gap analysis, and plan visualization. It communicates with the backend via secure REST APIs and emphasizes accessibility and clear state feedback.

## Component Inventory (Planned for MVP)
### App
Root shell, theme toggle, routing container, and global error boundaries. Current code includes a light/dark theme toggle and baseline layout.

### RoleSelectPage
Presents constrained dropdowns for currentRole and targetRole; submits to /api/v1/roles/select.

### CompetencyAssessmentPage
Displays canonical competencies for the target role; collects user self-assessed proficiency and submits to /api/v1/competencies/assess.

### GapResultsPage
Shows returned GapAnalysisResult in list and simple visualization form; triggers plan generation.

### PlanPage
Displays DevelopmentPlan and export link (PDF or URL). Provides copy/print controls.

### AdjacencyPanel
Lists adjacency suggestions with weights and rationale; allows quick navigation to a new target.

### AdminTemplatesPage (admin)
Creates/edits templates via /api/v1/templates.

### AdminAuditPage (admin)
Displays audit logs from /api/v1/audit-logs.

## Routing (Proposed)
- “/” → RoleSelectPage
- “/assess” → CompetencyAssessmentPage
- “/gaps” → GapResultsPage
- “/plan” → PlanPage
- “/admin/templates” → AdminTemplatesPage
- “/admin/audit” → AdminAuditPage

## State Management
- Local component state with React hooks for form control.
- Session-level state (e.g., selected roles, current competencies) can live in a lightweight context provider.
- API client wraps fetch with JWT header injection, error normalization, and retry for idempotent GETs.

## Accessibility
- All actionable controls have aria-labels and proper focus states.
- Keyboard navigation works across forms and tables.
- Color contrast meets WCAG AA; the built-in theme toggle preserves contrast across themes.

## Error Handling and Feedback
- Inline form validation with role/competency-specific messages.
- Banner for cross-cutting errors (e.g., network or server errors).
- Per-request loading indicators and disabled states to prevent double submits.
