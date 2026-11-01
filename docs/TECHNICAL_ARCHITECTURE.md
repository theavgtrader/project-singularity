# Technical Architecture — Project: Singularity

**Engine:** Godot 4.7.2 Stable, standard GDScript edition  
**Target:** Low-spec Windows PC with integrated graphics  
**Rendering:** 2D Compatibility renderer  
**Status:** Initial architecture; to evolve with tested gameplay needs.

## Hardware baseline

Primary test machine reported by the creator:
- Intel Celeron N4020 CPU.
- 4 GB RAM.
- Integrated graphics (the N4020 platform normally includes Intel UHD Graphics 600; verify the exact adapter on the machine).
- Windows PC.

The Godot editor is at its published 4 GB RAM minimum on this machine, so keep the editor workload lean. The project must be tested in both the editor and an exported build. Do not assume that editor performance represents standalone game performance.

## Project configuration

- Native viewport: 320 × 180.
- Window override: 960 × 540.
- Viewport stretch mode with aspect preserved and integer scaling.
- Nearest-neighbour texture filtering.
- Compatibility renderer (gl_compatibility).
- No 3D scene requirement.
- No third-party plugins in the initial milestone.
- GDScript only; no .NET dependency.

## Project structure

    project.godot
    scenes/
      main.tscn
      actors/
      world/
      ui/
    scripts/
      main.gd
      player/
      world/
      combat/
      systems/
      ui/
    assets/
      characters/
      environments/
      effects/
      audio/
      fonts/
    docs/
      GAME_DESIGN.md
      ART_DIRECTION.md
      TECHNICAL_ARCHITECTURE.md
      ASSET_REGISTER.md
      ROADMAP.md

## Architecture principles

Use small, focused scenes and scripts. Avoid a single global script that owns combat, quests, inventory, dialogue, and the world.

Planned subsystems:
- **World / district manager:** loads connected areas and transitions.
- **Player controller:** movement, facing, animation state, interaction requests.
- **Interaction system:** identifies nearby talk, inspect, use, and loot targets.
- **Character data:** health, attributes, level, equipment, and progression.
- **Combat system:** attacks, cooldowns, damage, status effects, and hit feedback.
- **Ability / protocol system:** resource costs, cooldowns, targeting, and effects.
- **Inventory and equipment:** item definitions, stack rules, equipment slots, and loot.
- **Quest and dialogue systems:** data-driven objectives, dialogue choices, and quest state.
- **Faction reputation:** relationship values and gates for later story content.
- **Save system:** versioned local save data, with migration strategy if the format changes.
- **UI:** presentation only; gameplay state belongs to systems, not drawing code.

Autoloads should be introduced only for services that genuinely need global access (for example, save management or audio settings). Prefer signals and explicit references over tightly coupled singletons.

## Performance rules

1. Keep gameplay 2D. Do not add 3D scenes as a shortcut for environment art.
2. Use texture atlases and modest source dimensions once external art is selected.
3. Avoid large uncompressed source images and unnecessary duplicate textures.
4. Prefer static tile layers and pre-drawn effects over continuously regenerated geometry.
5. Limit animated lights, particles, rain, and shader effects. Add them only after measurement.
6. Avoid per-frame work over every tile or every entity.
7. Use simple collision shapes and bounded active areas.
8. Load district content in manageable scenes rather than a single enormous world.
9. Keep audio files short and compressed where appropriate.
10. Test periodically on the N4020 / 4 GB target rather than postponing optimisation.

Initial target: stable play at 60 FPS where possible, with a practical minimum of 30 FPS on the reference machine. This is a target to measure, not a guarantee.

## Prototype systems already present

- scenes/main.tscn: initial scene composition.
- scripts/main.gd: coordinates world, player, and HUD interaction.
- scripts/player/player_controller.gd: eight-direction keyboard movement.
- scripts/world/undercity_prototype.gd: placeholder street drawn with simple shapes.
- scripts/world/rain_layer.gd: sparse animated weather.
- scripts/ui/prototype_hud.gd: location panel, interaction prompt, and dialogue message.

The prototype intentionally uses no imported assets. This makes the first build small and allows a controlled art-pack selection later.

## Validation checklist

For every milestone:
- Open the project in the selected stable Godot version.
- Check the Output and Debugger panels for parse errors and runtime errors.
- Run the main scene and test movement and interactions.
- Test window resizing and pixel scaling.
- Test an exported Windows build.
- Measure frame rate and memory on the reference PC.
- Record regressions before adding new features.
