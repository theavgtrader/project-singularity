# Asset Register and Licence Policy

No third-party binary assets have been committed in the initial prototype. The current scene is drawn with simple Godot primitives and original project code.

## Acceptance policy

Priority order:
1. CC0 / public-domain assets from a verifiable source.
2. Assets under permissive licences with clear redistribution and modification rights.
3. Other assets only where the licence is compatible with the game's distribution and required attribution can be met.

An asset being free to download does not mean it is open-source or free to redistribute. Do not copy assets from search-engine image results, commercial games, fan art, or packs with unclear licences.

## Candidate asset packs reviewed

These are approved candidates for evaluation and integration, not yet imported into the project. The archive's own licence and contents must be checked when the ZIP is obtained.

### Free Cyberpunk Pixel Art: Alley Tiles, Props and Sprites

- Creator/source: FreeGameSprites
- Source page: https://freegamesprites.com/en/packs/cyberpunk
- Download page: https://freegamesprites.com/en/packs/cyberpunk
- Declared licence: CC0 1.0, according to the pack page and included README/LICENSE notice.
- Size: 30 PNG assets, approximately 0.13 MiB.
- Contents: five 32×32 ground textures, five buildings, eight environment props, six inventory items, two furniture items, two characters, and two enemy sprites.
- Style: dark alley surfaces with blue and magenta accents.
- Important limitations: all assets are static; the pack does not provide a complete connected road system, animated characters, a full skyline, or a ready-made Godot level. The author/catalog description notes that the perspective varies between ground patches and upright props.
- Intended use: selectively replace placeholder ground, building, kiosk, neon sign, vending machine, puddle, streetlight, pipe, wire, and inventory graphics. Do not treat the pack as a complete district.

### CHROME DISTRICT — 20 Cyberpunk Pixel Characters

- Creator/source: booliebuilds
- Source page: https://booliebuilds.itch.io/chrome-district
- Specification page: https://chromedistrict.xyz/
- Declared licence: CC0 1.0, according to the creator's licence statement.
- Availability: free / name-your-own-price (a voluntary contribution is optional).
- Size: approximately 2.2 MB.
- Contents: 20 named cyberpunk characters, five camera angles per character, 8 directions × 6 walk frames, transparent PNG atlases and JSON metadata.
- Cell size: 56×84 px.
- Intended use: test the 22-degree elevated RPG view first; the top-down view is available if the scene perspective is changed. The consistent atlas contract should make directional walking animations straightforward to import into Godot.
- Important limitation: this is a character pack, not a tileset, UI pack, weapon pack, or effects library. The creator describes the sprites as procedurally generated/baked from voxel models, not hand-drawn animation.

## Required record for every imported pack

Before adding files to the repository, record:
- Asset or pack name.
- Creator / publisher.
- Canonical download or project page.
- Exact licence and version.
- Whether commercial use is allowed.
- Whether modification is allowed.
- Whether attribution is required.
- Date checked.
- Files or folders imported.
- Any changes made to the assets.

Keep the original licence file and attribution text alongside the imported pack where available. A catalogue statement is not a substitute for checking the archive's own licence notice.

## Register

| Status | Asset | Source | Licence | Notes |
|---|---|---|---|---|
| In use | Prototype street geometry and UI shapes | Original project code | MIT (repository code) | Drawn in GDScript; no external art files |
| Candidate | Cyberpunk alley environment pack | FreeGameSprites | CC0 1.0 as declared | 30 static PNG files; source/limitations documented above |
| Candidate | CHROME DISTRICT character sheets | booliebuilds | CC0 1.0 as declared | 20 characters with 8-direction, 6-frame walk atlases |
| Candidate only | Additional robot, drone, and boss sprites | To be evaluated | Not yet verified | Must match palette and perspective |
| Candidate only | Sound effects and music | To be evaluated | Not yet verified | Preserve attribution and licence notices where required |

## Important distinction

The repository's MIT licence applies to original code and documentation. It does not automatically relicense third-party assets. Each imported pack remains subject to its own licence and attribution requirements.
