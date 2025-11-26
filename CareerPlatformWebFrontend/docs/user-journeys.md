# User Journeys

## Overview
This document describes how users progress through the MVP UI, including error paths. The flows map 1:1 to backend endpoints and include inputs/outputs at each step.

## Happy Path (Single-Step Journey)
1. Landing: User sees role selection form with constrained lists.
2. Select roles: User chooses current=Chief Architect, target=CTO.
3. Assess: UI fetches target competencies and renders a short self-assessment; user submits levels.
4. Gaps: UI displays gap results and a summary visualization.
5. Plan: User generates a plan and (optionally) exports.

### Inputs
- RoleSelectPage: { currentRoleId, targetRoleId }
- CompetencyAssessmentPage: { competencies: [{id, proficiencyLevel}] }

### Outputs
- GapResultsPage: GapAnalysisResult with gaps and a compact viz model.
- PlanPage: DevelopmentPlan with steps and exportLink.

## Alternative Roles (Adjacency)
- The UI calls /api/v1/role-adjacency and shows suggested roles with weights.
- Selecting a suggestion resets the target role and returns to the assessment/gap steps.

## Admin (Secondary)
- AdminTemplatesPage: create/edit templates.
- AdminAuditPage: browse audit logs with filtering by time range.

## Error States
- Network/server error: banner with retry and diagnostic code.
- Invalid field: inline message per field; prevent submit until all fields valid.
- Unauthorized admin page: display 403 message and link back to home.

## Accessibility
- Keyboard focus order mirrors visual layout.
- All interactive elements include descriptive aria-labels.
- Errors are announced to screen readers via aria-live regions.
