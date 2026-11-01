# TRUGS Headquarters — interactive 3D model

A single-file, browser-based 3D model of the TRUGS headquarters: a 20-floor glass tower with 50 individually designed suites. It stands on a granite foundation plinth, with a tiered fountain court at the entrance and a terraced foundation garden at the rear.

Open `index.html` in a recent desktop browser. If your browser blocks module scripts from local files, serve the folder instead:

```bash
cd trugs-hq
python3 -m http.server 8000
# then open http://localhost:8000
```

Everything is generated in code, including every texture (marble, timber, terrazzo, carpet, water, artwork). Only three.js is loaded, from jsDelivr, so the whole project is one ~270 KB HTML file.

## What is in the model

| Area | Contents |
| --- | --- |
| Tower | 20 floors (6 m lobby, 4.2 m typical), 44 × 28 m floor plate, glass curtain wall with bronze fins and LED slab reveals, stone-clad core with lifts, fritted-glass crown with illuminated 3D **TRUGS** letters on all four faces, helipad and spire with aviation beacon |
| Entrance | Granite podium, 14-step grand stair, cantilevered canopy with gold lettering, revolving door, three-tier limestone fountain inside a drop-off circle (16 arching jets, bubblers, overflow curtains, underwater lights), flags and a monument sign |
| Rear foundation garden | Three granite terraces with a central water stair, a 60 m reflecting pool with 28 crossing arched jets, six parterres with box hedges, topiary and flowers, cypress rows, vine pergolas, and a fountain with a granite sphere, a rotating bronze armillary and a 13-column colonnade |
| Surroundings | Streets with moving traffic, a car park with about 75 parked cars, around 650 trees and a city skyline that lights up at night |

## The 50 suites

Odd floors hold three suites (A, B, C). Even floors hold two (A, B). Each suite has its own floor finish, wall finish, palette, furniture layout and lighting.

| Floor | Suite A | Suite B | Suite C |
| --- | --- | --- | --- |
| 1 | Brand Experience Showroom | TRUGS Café & Espresso Bar | Grand Atrium Lobby |
| 2 | Hall of Ideas Auditorium | Welcome Training Academy | |
| 3 | Nordic Open Studio | Midnight Navy Workspace | Glass Huddle Room |
| 4 | Biophilic Garden Office | Data Science Lab | |
| 5 | Atelier Design Studio | Product Prototype Workshop | Podcast & Media Studio |
| 6 | Wellness & Fitness Centre | Serenity Spa Lounge | |
| 7 | Emerald Velvet Lounge | Terracotta Collaboration Hub | Kyoto Zen Meditation Room |
| 8 | Grand Library & Reading Room | Quiet Focus Booth Hall | |
| 9 | Engineering Bullpen | Network Operations Centre | Server & Cloud Vault |
| 10 | Game & Recreation Arena | Sky Dining Hall | |
| 11 | Marketing Creative Loft | Sales Command Floor | Walnut Boardroom |
| 12 | Art Deco Gallery Salon | Music & Jam Room | |
| 13 | Legal & Compliance Chambers | Finance Trading Desk | Onyx Conference Room |
| 14 | Innovation & Robotics Lab | Virtual Reality Studio | |
| 15 | People & Culture Hub | Mediterranean Terrace Café | Sunset Huddle Lounge |
| 16 | Investor Relations Suite | Crystal Ballroom | |
| 17 | Strategy War Room | Executive Office Suite | Marble Board Chamber |
| 18 | CTO Office Suite | CFO Office Suite | |
| 19 | Executive Club Lounge & Bar | Private Dining Room | Wine & Whisky Tasting Room |
| 20 | Chairman's Office | TRUGS Sky Lounge | |

## Using it

- **Views tab**: fly to the tower, entrance fountain, rear garden, crown, street level or the site plan. Switch between day, golden hour and night. Toggle slow orbit, bloom and sun shadows. Start an automatic suite tour.
- **Floors tab**: an elevator panel. Pressing a floor lifts every floor above it away so you can look inside.
- **Suites tab**: a searchable directory. Picking a suite flies the camera in through the window.
- Hover over the tower to see suite names. Click to open a suite card, and click the same suite again to walk in.
- In a suite: drag to look around, use the arrow keys to move to the next or previous suite, and press Esc to step back out.
- Deep links: append `#suite-7A` (for example) to the URL to open straight into a suite.
- **Export model (.glb)** downloads the full scene (about 95 MB) for Blender, Unreal, Unity or other tools. The file passes the Khronos glTF validator with no errors.

## Technical notes

- three.js r160. All suites on a floor are batched into about a dozen merged meshes. The whole scene is about 600 draw calls and 1.9 million triangles.
- Sun shadows are rendered only when something changes. The fountain jets are a single GPU particle system of about 17,000 particles.
- If the first few seconds run below 28 fps, the page lowers its render resolution automatically.
- To change a suite, edit its entry in the `SUITES` array (name, generator, floor and wall finish, palette). Each `GEN.*` function builds one suite type.
- The model is real-time and stylised. For photoreal stills, export the GLB and render it in Blender (Cycles) or Unreal.
