# Materials

This folder will contain materials and shaders for the Orbital Haven JRPG theme.

## Planned Structure

```
Materials/
├── UI/                # Interface materials
│   ├── ButtonMat.mat
│   ├── PanelMat.mat
│   ├── HealthBarMat.mat
│   ├── ManaBarMat.mat
│   └── ProgressBarMat.mat
│
├── Effects/           # Visual effect materials
│   ├── HitFlash.mat
│   ├── HealGlow.mat
│   ├── MagicCircle.mat
│   └── Particles/
│       ├── FireParticle.mat
│       ├── IceParticle.mat
│       └── LightningParticle.mat
│
├── World/             # Environmental materials
│   ├── OrbitalSurface.mat
│   ├── SpaceStation.mat
│   ├── Hologram.mat
│   └── ForceField.mat
│
└── Shaders/           # Custom shaders
    ├── UIGradient.shader
    ├── HolographicDisplay.shader
    └── SciFiEmission.shader
```

## Implementation Status

⚠️ **Materials are currently being developed**

Materials will be optimized for:
- VR performance (Quest 2 compatible)
- JRPG aesthetic (vibrant, readable)
- Space/orbital theme
- Mobile GPU efficiency

## Material Guidelines

When creating materials for this theme:

1. **Performance First**
   - Use Standard shader when possible
   - Avoid expensive shader operations
   - Test on Quest 2

2. **Visual Consistency**
   - Follow established color palette
   - Maintain sci-fi/space aesthetic
   - Ensure VR readability

3. **Optimization**
   - Combine textures where possible
   - Use atlasing for UI elements
   - Minimize overdraw

## Color Palette (Orbital Haven Theme)

- **Primary**: Deep Space Blue (#0A1929)
- **Secondary**: Neon Cyan (#00E5FF)
- **Accent**: Stellar Gold (#FFD700)
- **UI**: Light Gray (#E0E0E0)
- **Success**: Green (#4CAF50)
- **Warning**: Amber (#FFC107)
- **Error**: Red (#F44336)

See theme documentation for more details.
