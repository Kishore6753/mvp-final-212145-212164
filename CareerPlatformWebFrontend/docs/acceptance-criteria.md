# Acceptance Criteria

## Functional
- Users can select current and target roles from a constrained list.
- Users can self-assess required competencies and submit successfully.
- Gap results render with clear indications of “meets”, “near”, and “gap”.
- Users can generate and view a development plan and obtain an export link.
- Adjacent roles display with weights and settable as new targets.

## Accessibility
- All forms and controls are keyboard operable.
- Color contrast meets WCAG AA.
- Live-region announcements for validation and server errors.

## Integration
- All requests include JWT when required.
- Responses are rendered in accordance with interface schemas.
- Error payloads produce friendly user feedback without leaking sensitive details.

## Non-Functional
- UI state persists across navigation within a session.
- Loading indicators and disabled states prevent duplicate submissions.
- The theme toggle remains functional and accessible.
