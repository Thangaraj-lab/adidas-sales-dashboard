# HelQix semiconductor campus

An interactive night-time 3D model built from the HelQix concept render: a semiconductor company's headquarters, wafer fab and utility plant. Open `index.html` in a recent desktop browser, or serve the folder with `python3 -m http.server`.

## What is in the model

**Headquarters** (curved glass atrium, west wing, east tower). Every floor is fitted out and visible through the glass:

| Building | Floor | Rooms |
| --- | --- | --- |
| Atrium | 1 | Lobby & Wafer Gallery (illuminated 300 mm wafer sculpture, reception, security gates) |
| Atrium | 2 | Customer Experience Center · Staff Café |
| Atrium | 3 | Chip Design Studio (EDA) · Boardroom |
| Atrium | 4 | Executive Suite · AI & Quantum Research Lab |
| West wing | 1 | Assembly, Test & Packaging · Logistics & Shipping |
| West wing | 2 | Failure Analysis Lab · Metrology Lab |
| West wing | 3 | R&D Engineering Floor · Collaboration Lounge |
| East tower | 1–5 | Security & Operations Center · HPC Data Center · Reliability & Quality Lab · Training Academy · Wellness Center |

**Fab 1**, a cleanroom linked to the atrium by a glass skybridge:
- Lithography bay (EUV scanners, under yellow light)
- Etch bay and deposition bay (cluster tools, CMP polishers)
- Diffusion, implant and wet bay
- Overhead transport rails carrying moving wafer pods, and wafer stockers
- Sub-fab below: pumps, abatement, chillers and colour-coded process piping
- Roof: exhaust scrubbers, air-handling units and solar panels

**Utility yard:**
- Ultrapure water plant
- Bulk gas tanks and chemical yard
- Substation, backup generators, chillers and cooling towers
- Pipe rack running into the fab

**Grounds:**
- About 190 walking people, including fab staff in white cleanroom suits
- Branching cherry trees in bloom, with falling and fallen petals
- Fountains, flags, the monument sign and the armillary sphere sculpture
- Sky beams, drones, fireworks and a city skyline

## Controls

- **Camera views:** Entrance, Campus, Aerial, Sculpture, Fab & utilities.
- **Rooms & systems:** lists every room and system. Picking one lifts away the floors or roof above it, flies the camera there and shows a short description.
- **Toggles:** Festival colours (rainbow LED chase), Fireworks, Sky beams, Slow orbit.

Everything is drawn in code. Only three.js r160 is loaded, from jsDelivr.
