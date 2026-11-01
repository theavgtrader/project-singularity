# Art Direction — Project: Singularity

**Status:** Initial visual direction  
**Target:** Enhanced 16-bit pixel-art presentation with a late-1980s retro-futurist imagination.

## Visual thesis

Imagine a future city as an artist in the late 1980s might have imagined it: immense concrete structures, elevated transit, chunky terminals, CRT displays, analogue controls, industrial machinery, cybernetics, and glowing signs. The world is deliberately pixel-art, but the environments should feel layered and richly composed.

The result should not look like a medieval RPG with neon pasted over it, nor like a modern 3D cyberpunk game reduced to a tiny resolution.

## Composition

- Top-down 3/4 view for navigation and readable combat.
- Streets, rooftops, interiors, service corridors, and industrial platforms should have clear silhouettes.
- The player and interactable objects must remain readable against detailed environments.
- Use layered signs, cables, vents, windows, pipes, kiosks, puddles, street clutter, and silhouettes to make spaces feel inhabited.
- Avoid excessive decoration that obscures navigation.

## Pixel standards

| Element | Starting standard |
|---|---|
| Game viewport | 320 × 180 |
| Tile grid | Primarily 16 × 16 px |
| Character sprite | Approximately 24 × 32 px; adjust to source pack |
| Small props | 8 × 8 to 24 × 24 px |
| Large props | Built from tile multiples |
| Window size | 960 × 540 (3× viewport) |
| Scaling | Viewport stretch with integer scaling |
| Texture filtering | Nearest-neighbour |

These are starting constraints. Imported assets may use different native dimensions, but they should be converted or grouped consistently.

## Palette

Use a controlled palette rather than relying on glow alone.

- Deep navy and blue-black for shadows and large structures.
- Desaturated steel blue and slate for concrete, roads, and machinery.
- Cyan and turquoise for public technology, signals, and navigation.
- Magenta and violet for corporate branding, illicit technology, and nightlife.
- Warm amber and industrial orange for power, warning lights, and work areas.
- Limited pale highlights for important interactables.

Neon should be an accent. If every surface glows, the city loses contrast.

## District identity

The city districts will share a common material language but use distinct emphasis:
- **Undercity:** patched metal, exposed cables, signs, market awnings, warm work lights, dense detail.
- **Industrial Zone:** repeating machinery, hazard markings, steam, heavy silhouettes, amber and steel.
- **Upper / corporate districts:** clean geometry, controlled lighting, glass-like forms suggested through pixels, pale cyan and white.
- **Forgotten Network:** dark transit infrastructure, old terminals, emergency lights, sparse signage.
- **Central Core:** more abstract architecture and carefully staged colour shifts.

## Lighting and atmosphere

The initial project must run on integrated graphics. Prefer:
- Pre-drawn light pools and coloured overlays.
- Small animated sign sprites and lamp frames.
- A limited number of 2D lights where they materially improve readability.
- Rain streaks, steam puffs, drifting particles, and animated screens with restrained counts.
- Palette shifts and contrast rather than expensive full-screen post-processing.

Avoid real-time 3D lighting, volumetric effects, blur, depth of field, large shader stacks, or full-screen distortion effects in the first build.

## UI direction

The interface should feel like a utilitarian computer system redesigned with retro-futurist graphic language:
- Dark panels with fine borders.
- Cyan for neutral information and active navigation.
- Magenta for neural or experimental systems.
- Amber for warnings and critical states.
- Compact pixel typography with clear hierarchy.
- Readable body text; do not force all text into tiny pixel fonts.

## Asset integration rule

Do not combine random asset packs without a style review. Every candidate pack must be checked for:
1. Perspective and pixel density.
2. Palette compatibility.
3. Character proportions.
4. Animation quality.
5. Licence and attribution requirements.

Use the asset register before adding third-party art to the repository.
