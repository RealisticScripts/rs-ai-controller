# RS AI Controller

RS AI Controller is a lightweight FiveM resource for controlling **ambient traffic** and **ambient pedestrians** through the built-in GTA/FiveM density natives.

## Features
- `TrafficDensity` controls moving traffic, parked vehicles, and random vehicle population.
- `PedDensity` controls walking pedestrians and scenario pedestrians.
- `Debug` provides true in-game debug visibility with a lightweight on-screen overlay, plus startup console output.
- Server-side GitHub release version check.



## Installation
1. Place the `rs-ai-controller` folder inside your server's `resources` directory.
2. Add the resource to `server.cfg`:

```cfg
ensure rs-ai-controller
```

3. Edit `config.lua` to match your preferred density values.

## Configuration
```lua
Config = {}
Config.Debug = false
Config.TrafficDensity = 0.0
Config.PedDensity = 0.0
```

### Density values
- `0.0` disables that ambient group.
- `1.0` keeps default population density.
- Values between `0.0` and `1.0` reduce density proportionally.

## Debug
Set `Config.Debug = true` to enable:
- startup console output of active settings
- a small in-game overlay showing the active traffic and ped density values

Set `Config.Debug = false` to disable debug output.

## Version Check
The resource includes a server-side GitHub release check for:
- current version: `1.0.0`
- repository: `RealisticScripts/rs-ai-controller`

## Files
- `fxmanifest.lua`
- `config.lua`
- `client.lua`
- `server.lua`
- `README.md`
- `LICENSE`

## License

MIT License © 2026 Realistic Scripts
