# g-secrets
Secret Scanning for LabVIEW

## 🔍 What is Secret Scanning?

**Secret scanning** is the process of automatically detecting sensitive information —  
such as API keys, passwords, tokens, or credentials — accidentally stored in source code,  
configuration files, or project repositories.

Such secrets can be easily exposed through version control systems or shared archives,  
potentially giving unauthorized access to infrastructure, databases, or external services.

By scanning your *LabVIEW project files*, **g-secrets** helps you:
- Identify hard-coded credentials before they are committed or released.  
- Enforce secure development practices within your team or CI pipelines.  
- Reduce the risk of data breaches or accidental information leaks.  

In short: **g-secrets** makes it easier to keep your LabVIEW projects secure.

> 💡 **Why g-secrets?**  
> Excellent tools like *[Gitleaks](https://github.com/gitleaks/gitleaks)* already exist for conventional text-based source code,  
> but they cannot inspect *LabVIEW binaries (.vi)* or *VI histories*.  
> Secrets hidden within front panel constants, block diagram strings, or VI descriptions remain invisible to such scanners.  
> **g-secrets** bridges this gap by exporting all relevant strings from LabVIEW projects and analyzing them.

## ⚙️ How g-secrets Works

The workflow is based on two main VIs (please refer to the VI documentation for more detailed information):

---

### 🧩 1. Export Strings.vi

This VI creates references to of all elements in a **LabVIEW Project (.lvproj)** and uses them to call the [VI Strings:Export Method](https://www.ni.com/docs/en-US/bundle/labview-api-ref/page/properties-and-methods/vi-server/vi/exportvistrings.html).

After that, if iterates through the VI references in the project and adds **revision histories** to the exported string file.

Finally, the **descriptions** of the project and of all libraries (including classes) in the project are added to the exported string file.

### 🧩 2. Find Leaks.vi

This VI searches the exported **string file** for potential secrets defined in a **secrets configuration** XML file.

If any secrets are found, the VI raises a **custom error \(-8000\)**: ```Code Contains Secrets```.

---

## 🧰 Installation and usage

The intended usage is to run **g-secrets** from the command line via [G CLI](https://www.vipm.io/package/wiresmith_technology_lib_g_cli/) as a *pre-commit hook*, so that no secrets land in your repository.

You can install the package through **vipm.io**. The package contains a CLI interface that will be installed in `<LabVIEW>\vi.lib\G CLI Tools, allowing you to invoke the tool directly through **g-cli**.

---

### 💻 Command-Line Interface (CLI)

To view available options and examples, run:

```powershell
g-cli --lv-ver 2025 --arch 32 --kill g-secrets -- --help
```

This will produce the following output:

```powershell
============== Overview =======================

g-secrets by Hasbun Wood Engineering

Secret Scanning for LabVIEW code.

https://github.com/HasbunWoodEngineering/g-secrets

This project is distributed under the MIT License.

See LICENSE and THIRD_PARTY_LICENSES.txt in
<LabVIEW\>vi.lib\Hasbun Wood Engineering\G-Secrets

============== Options ========================
--file [value]: Path to file to be analyzed (.lvproj or .vi)

--help [flag , optional]: Display help and exit

--export-only [flag , optional]: When this flag is set g-secrets will export the strings to a file in the same repository as the target, without performing any search of secrets (string-file overwrites this file location). Use this flag when using an external secret scanning tool.

--quiet [flag , optional]: If this flag is set, no results will be displayed in the command line interface

--include-secrets [flag , optional]: If this flag is set found secrets will be explicitely added to reports/displayed information.

--secrets-config [value , optional]: Path to secrets configuration XML file. If you do not provide a custom file, the default file will be used.

--string-file [value , optional]: Use this parameter to specify a custom output file location for the exported strings.

--log-file [value , optional]: Use this parameter to specify a custom log file location.

--report [value , optional]: Use this parameter to specify a file to save a text report.


=============== Examples =====================

Only Export strings to the same location of the target to use an external secret scanning tool:
g-cli --lv-ver 2025 --arch 32  --kill g-secrets -- --file "Your-Project.lvproj" --export-only

Search for secrets and display results in CLI, explicitely showing found secrets:
g-cli --lv-ver 2025 --arch 32 --kill g-secrets -- --file "Your-Project.lvproj" --include-secrets

Save report to file:
g-cli --lv-ver 2025 --arch 32 --kill g-secrets -- --file "Your-Project.lvproj" --report "C:\Users\Public\Secrets.txt"

============================================
```

Any VIs in the repository that are not part of the project (e.g. *Post-Build Actions.vi*) will not be analyzed. Run **g-secrets** for these VIs separately.

If you do not provide a custom *secrets configuration XML file*, the [Basic Configuration.xml](./src/Basic%20Configuration.xml) will be used. This file contains regular expressions to find *generic private keys*, *AWS Access Key IDs*, several *Github* credentials (*project access tokens*, *App tokens*, *Oauth*, *Refresh tokens*), and *Gitlab Project access tokens*.

### 🔗 Setting up your git-hook

There are two options:

#### Option 1: String Exporting and Secret Scanning using *g-secrets*

Perform string exporting and secret scanning with **g-secrets** as a **pre-commit** git-hook. 

To achieve this you need:

1. A **Bash-Shim** to run power shell code - Save the following script ```.git/hooks/pre-commit``` (**Note**: no extension and *LF* line endings):
```bash
#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
exec pwsh -NoProfile -ExecutionPolicy Bypass -File "$SCRIPT_DIR/pre-commit.ps1"
```

2. A ```pre-commit.ps1``` script with the following content:
```powershell
# .git/hooks/pre-commit.ps1
$ErrorActionPreference = 'Stop'

# Repo-Root
$repoRoot = (git rev-parse --show-toplevel)
$project  = Join-Path $repoRoot 'Your Project.lvproj'

# Modify this line to use other options
g-cli --lv-ver 2025 --arch 32 --kill g-secrets -- --file "$project"

# Propagate exit code
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
```

And that's it! 

When you commit your code the git-hook will run **g-secrets** and if any secret is found, the commit will be aborted with a clear message.

#### Option 2: String Exporting with *g-secrets* + Secret Scanning with another Tool *(Recommended)*

Use **g-secrets** to export strings of your *LabVIEW* code to the repository and apply an external secret scanning tool (e.g. [gitleaks](https://github.com/gitleaks/gitleaks)) to find leaks. 

This approach is recommended because such tools will not only scan the exported strings from you *LabVIEW* code, but anything else you have in your repository (e.g. TestStand sequences if saved as XMLs, INI-Files, Python code, ...).

**Note**: Any secrets located in a readable *LabVIEW* file (e.g. in the *.lvproj* file) will be found twice with this approach, because **g-secrets** will duplicate these secrets in the **string file**.

## Custom errors

| Error Code  | Description                                                     |
|-------------|-----------------------------------------------------------------|
| -8000       | Code contains secret                                            |
| -8001       | Test project element not found (only relevant for unit testing) |

## 🧩 Continuous Integration (CI)

**g-secrets** includes a functional CI pipeline that runs **unit tests** and **VI Analyzer checks** to ensure code quality and consistency.  
The workflow is executed on a **self-hosted GitHub runner** with LabVIEW installed.

For security reasons, CI is **deactivated in the public repository** —  
self-hosted runners execute workflows directly on private infrastructure, which poses a potential safety risk when triggered from public forks or pull requests.

All workflow definitions and configuration files are available in the repository under `.github/workflows/`,  
so you can reproduce the CI locally or adapt it to your own secure environment.

## 🧾 Licenses & Dependencies

**g-secrets** is distributed under the MIT License (see [LICENSE](LICENSE)).

In addition to its own license, **g-secrets** depends on several third-party LabVIEW libraries and toolkits.

All dependencies are open-source or redistributable under permissive licenses (MIT, BSD-2, BSD-3, or 0BSD).

Full details and license texts are available in [THIRD_PARTY_LICENSES.txt](THIRD_PARTY_LICENSES.txt).

### Using g-secrets (Runtime)

If you just want to **use the package** (for example, install it in LabVIEW or integrate it into another system):

1. Install **g-secrets** via the **[VI Package Manager (VIPM)](https://www.vipm.io/)**.

2. VIPM will automatically install all required **runtime dependencies**.

**Runtime dependencies:**

- G CLI
- EasyXML Toolkit for LabVIEW
- OpenG Array Library
- OpenG Error Library
- OpenG File Library
- OpenG String Library
- OpenG Variant Library

### Developing and Testing (Development Dependencies)

If you plan to **develop**, **run unit tests**, or **execute CI/CD pipelines**  
(for example, on a private GitLab or GitHub runner):

You will need the **development dependencies** in addition to the runtime ones.  

These are defined in [G-Secrets.dragon](./G-Secrets.dragon) configuration file.

**Development dependencies:**
- Blue Formatter for LabVIEW  
- Caraya CLI Extension  
- Caraya Unit Test Framework  
- Epoch Date & Time  
- FileWatcher  
- Hidden Gems in vi.lib  
- JKI State Machine  
- jki_rsc_toolkits_palette  
- LabVIEW Open Source Palette  
- OpenURI  
- Rainbow Terminal  
