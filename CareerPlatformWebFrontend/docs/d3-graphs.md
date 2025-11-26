# D3 Graphs

## Overview
The MVP includes two simple visualizations powered by D3:
1) Role Adjacency Graph (force-directed)
2) Competency Coverage (radial or bar representation using the same data model)

The data model is derived from canonical Excel sources and backend responses.

## Data Shapes
### Role Adjacency
```json
{
  "nodes": [
    { "id": "ca", "type": "role", "label": "Chief Architect" },
    { "id": "cto", "type": "role", "label": "CTO" },
    { "id": "ciso", "type": "role", "label": "CISO" }
  ],
  "links": [
    { "source": "ca", "target": "cto", "weight": 0.75, "rationale": "DevEx, Portfolio, Strategy" },
    { "source": "ca", "target": "ciso", "weight": 0.86, "rationale": "Risk-by-design, Vendor mgmt" }
  ]
}
```

### Competency Coverage (excerpt)
```json
{
  "competencies": [
    {
      "id": "enterprise_architecture",
      "name": "Enterprise Architecture",
      "current": "P",
      "requiredMin": "P",
      "requiredMax": "A"
    },
    {
      "id": "platform_economics",
      "name": "Platform Economics",
      "current": "P",
      "requiredMin": "A",
      "requiredMax": "A"
    }
  ]
}
```

## Role Adjacency (Force Layout) – Pseudocode
```javascript
// input: { nodes, links }
const width = 800, height = 500;

const simulation = d3.forceSimulation(nodes)
  .force("link", d3.forceLink(links)
    .id(d => d.id)
    .strength(l => Math.max(0.05, l.weight))) // higher weight = tighter link
  .force("charge", d3.forceManyBody().strength(-150))
  .force("center", d3.forceCenter(width / 2, height / 2));

const color = d => d.type === "role" ? "#1f77b4" : "#ff7f0e";

// Edges
svg.selectAll("line")
  .data(links)
  .enter().append("line")
  .attr("stroke-width", l => 1 + 4 * l.weight);

// Nodes
const node = svg.selectAll("circle")
  .data(nodes)
  .enter().append("circle")
  .attr("r", 10)
  .attr("fill", color)
  .call(drag(simulation));

simulation.on("tick", () => {
  // Update positions...
});
```

## Competency Coverage – Visual Encoding
- Gap color scale:
  - current ≥ requiredMax → green
  - current within [requiredMin, requiredMax) → amber
  - current < requiredMin → red
- Map levels to numeric scale: F=0, P=1, A=2, Au=3 for consistent comparisons.

## Overlap Method (Adjacency)
- Per-competency overlap = min(level_i, level_j) / max(level_i, level_j).
- Overall overlap = mean across mutual competencies.
- Excel ranges (P–A or A–Au) are evaluated using max level for required targets.

## Interaction
- Hover a link to show rationale and top gaps.
- Click a suggested node to set a new target role and refresh required competencies.
