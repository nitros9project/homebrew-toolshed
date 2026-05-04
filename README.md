# 🍺 Homebrew ToolShed Tap

This repository provides a Homebrew tap for the **NitrOS-9 ToolShed** and related utilities.

It allows macOS (and Linux with Homebrew) users to easily install and manage tools from the NitrOS-9 ecosystem using the familiar `brew` workflow.

---

## 📦 What’s Included

Currently, this tap provides:

* **ToolShed** – Utilities for working with NitrOS-9 systems and disk images

Additional tools may be added over time as they are packaged and stabilized.

---

## 🚀 Installation

First, add this tap:

```bash
brew tap NitrOS9Project/ToolShed
```

Then install the ToolShed:

```bash
brew install ToolShed
```

---

## 🔄 Upgrading

To get the latest version:

```bash
brew update
brew upgrade ToolShed
```

---

## 🔌 Optional FUSE Support

Some features of **ToolShed** can take advantage of FUSE (Filesystem in Userspace) to mount disk images directly.

FUSE support is **optional** and is not enabled by default in the Homebrew formula.

### macOS

On macOS, FUSE support can be enabled via Homebrew using `fuse-t`.

To enable FUSE support:

```bash
brew install fuse-t
brew reinstall ToolShed --build-from-source
```

That’s it, once `fuse-t` is installed, the ToolShed build will detect it and enable FUSE support automatically.

### Linux

On Linux, install FUSE development packages before building:

Debian/Ubuntu:

```bash
sudo apt install libfuse-dev
```

Fedora:

```bash
sudo dnf install fuse-devel
```

Then reinstall:

```bash
brew reinstall ToolShed --build-from-source
```

### How it works in the formula

The formula will:

* Detect FUSE headers/libraries at build time
* Enable FUSE support automatically if available

If FUSE is not present, ToolShed will build without it.

---

## 🛠 Development & Contribution

Contributions are welcome!

### Prerequisites

* Homebrew installed
* Basic familiarity with Ruby (for formulae)

### Local Development

Clone the tap:

```bash
git clone https://github.com/NitrOS9Project/homebrew-ToolShed
cd homebrew-ToolShed
```

Install from your local copy:

```bash
brew install --build-from-source ./Formula/ToolShed.rb
```

---

## 📐 Adding or Updating a Formula

1. Create or edit a formula in the `Formula/` directory
2. Ensure it:

   * Builds cleanly from source
   * Uses a tagged release tarball
   * Has a valid `sha256`
3. Test locally:

   ```bash
   brew install --build-from-source ./Formula/<formula>.rb
   brew test <formula>
   brew audit --strict <formula>
   ```

---

## 🧪 Testing

Each formula should include a minimal `test do` block that verifies:

* The binary runs
* Basic functionality works

---

## 📜 Versioning Policy

* This tap tracks **stable upstream releases**
* Older versions are not maintained unless there is a strong need
* Breaking changes will follow upstream

---

## ⚠️ Disclaimer

This is a community-maintained tap and is not officially affiliated with Homebrew core.

---

## 🤝 Acknowledgments

* The NitrOS-9 Project contributors
* The Homebrew community for tooling and infrastructure

---

## 📬 Issues

If you encounter problems:

* Open an issue in this repository
* Include:

  * macOS/Linux version
  * `brew config` output
  * Steps to reproduce

---

## 📄 License

Formulae in this repository are typically licensed under the same terms as their upstream projects unless otherwise noted.
