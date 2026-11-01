# PROJECT: SINGULARITY

*A retro-futurist action RPG about intelligence, power, and who gets to own the future.*

Project: Singularity is a single-player, top-down 2D action RPG set after an AI singularity. A small group controls the world's most powerful compute resources while most people live beneath the systems that govern them. The protagonist, the child of a deceased inventor, uncovers the work their father left behind and fights to restore balance.

## Current status

**Milestone 0.1 — Undercity visual and movement prototype**

The repository currently contains:
- A Godot project configured for low-spec integrated graphics.
- A small, procedurally drawn Undercity street scene.
- Basic eight-direction player movement.
- A camera, lightweight rain effect, interaction prompts, and prototype HUD.
- Initial game-design, art-direction, technical, asset-licensing, and roadmap documents.

The current environment uses original in-engine placeholder geometry. Two CC0 candidate packs have been reviewed and recorded in the asset register, but their binary files have not yet been imported. This keeps the initial download small while we confirm the project and asset fit.

## Requirements

- Godot **4.7.2 Stable**, standard edition (not .NET).
- Windows 10/11 64-bit recommended.
- 2D Compatibility renderer; no dedicated GPU or 3D modelling software required.

Download: https://godotengine.org/download/windows/

The project is designed around a low-spec test machine: Intel Celeron N4020, 4 GB RAM, and integrated graphics. The editor may be slow with only 4 GB RAM; close unnecessary applications while working.

## Run the project

1. Download the repository as a ZIP from GitHub and extract it.
2. Open Godot.
3. Choose **Import** and select the extracted project.godot file.
4. Open the project and press **F6** to run the current scene or **F5** to run the project.

Repository: https://github.com/theavgtrader/project-singularity

## Prototype controls

| Input | Action |
|---|---|
| W / A / S / D | Move |
| Arrow keys | Move |
| E | Interact with a nearby character or terminal |
| Esc | Show the controls reminder |

## Project principles

1. **The story comes first.** Technology, systems, enemies, and progression should reinforce the game's themes.
2. **AI is not automatically evil.** Human institutions, autonomous agents, and augmented people have conflicting motives.
3. **The objective is balance.** The protagonist challenges concentrated control over intelligence and compute; the precise endgame remains a story decision.
4. **Retro by design.** Use a deliberate 16-bit-inspired pixel-art identity, not degraded modern graphics.
5. **Low-spec first.** 2D, small viewports, modest asset sizes, restrained effects, and no runtime 3D.
6. **Respect asset licences.** Every third-party asset must have a recorded source and licence before it enters the game.

## Repository layout

    project.godot
    scenes/                 Godot scenes
    scripts/                Gameplay and presentation scripts
    assets/                 Approved art, audio, and fonts
    docs/                   Design and production documentation

## Documentation

- [Game design](docs/GAME_DESIGN.md)
- [Art direction](docs/ART_DIRECTION.md)
- [Technical architecture](docs/TECHNICAL_ARCHITECTURE.md)
- [Asset register and licence policy](docs/ASSET_REGISTER.md)
- [Development roadmap](docs/ROADMAP.md)

## Licence

The game's original code and documentation are released under the MIT Licence in this repository. Third-party assets may have separate licences; those licences will be recorded individually and apply to the assets they cover.
