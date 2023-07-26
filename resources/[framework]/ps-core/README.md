# PS Core

PS Core gathers common functions and utility to provide faster development. PS Core is in constant development to enable as much generic code to be moved into one single place.

## Usage

To initialize `ps-core`, import the the core object:
```lua
PSCore = exports['ps-core']:GetCoreObject()
```
## Modules
### `PSCore.Resource`

The `PSCore.Resource` module includes the following functions:
https://github.com/Project-Sloth/ps-core/#pscoreresourcecheckforupdatesname
1. [`PSCore.Resource.CheckForUpdates(name)`](#pscoreresourcecheckforupdatesname)
2. [`PSCore.Resource.CheckResourceName(name)`](#pscoreresourcecheckresourcenamename)

#### `PSCore.Resource.CheckForUpdates(name)`

Checks for updates for the specified resource or the invoking resource if not provided.

- Parameters:
  - `name` (optional): The name of the resource to check for updates.

The function retrieves the repository and version metadata from the fxmanifest.lua file. Make sure you have included the information about the repository name and the version currently used. 
An example for ps-core is:
```lua
version '1.0.0'
repository 'Project-Sloth/ps-core'
```

---

#### `PSCore.Resource.CheckResourceName(name)`

Checks a resource name for a specific pattern and prints an error message if the pattern is found.

- Parameters:
  - `name` (optional): The resource name to be checked.

The function compares the resource name with the specified pattern. If a match is found, it prints an error message instructing to remove the pattern from the resource folder name. This is basically to ensure that the resource name doesn't hasn't the branch name as a post-fix in the resource folder.
