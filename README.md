Perfect — with your updated `fstab` and theme links, here is the revised and complete `README.md` for your **MyNobaraDotFiles** repo:

---

# MyNobaraDotFiles

Personal dotfiles, fonts, GNOME themes, and system tweaks for my setup on **Nobara Linux** (Fedora-based).
This repo includes configs for terminal tools, GUI enhancements, fonts for language learning, and system usability fixes.

---

## 📁 What's Inside

### 🖥 Terminal & CLI Tools

* **Kitty**: Custom configuration for the `kitty` terminal emulator.
* **Fastfetch**: Modified logos for **Fedora** and **Nobara** included.
* **MangoHud**: Performance overlay settings for monitoring GPU/CPU stats.
* **Starship**: My personal `starship.toml` config for a clean, useful shell prompt.

---

### 🔤 Fonts for Anki

Fonts used specifically with **Anki** to support proper rendering of:

* 🈶 **Japanese**
* 🇨🇳 **Chinese**

> Note: Fonts are included only if the license allows redistribution.

---

### 🎨 GNOME Look & Feel

These are the themes I use for a modern, macOS-inspired desktop experience on GNOME:

| Component        | Theme Name            | Source                                                                  |
| ---------------- | --------------------- | ----------------------------------------------------------------------- |
| **Shell Theme**  | WhiteSur-Dark         | [WhiteSur GTK Theme](https://github.com/vinceliuice/WhiteSur-gtk-theme) |
| **Icon Theme**   | MacTahoe-icon-theme   | [MacTahoe Icons](https://github.com/vinceliuice/MacTahoe-icon-theme)    |
| **Cursor Theme** | Bibata-Modern-Classic | [Bibata Cursors](https://github.com/ful1e5/Bibata_Cursor)               |

> 💡 These are placed in the `themes/` folder. You can install them manually or use the included files.

---

### ⚙️ GNOME Usability Tweaks

* **`Fix alttab Gnome.txt`**
  Enables multiple **individual window instances** in the Alt+Tab switcher (instead of grouping by app).

* **`Fix batery porcentage Gnome.txt`**
  Shows the **battery percentage** in GNOME’s top bar.

Use GNOME Tweaks or `gsettings` to apply these changes.

---

### 💾 fstab Configuration for External Game Drive

Included: `fstab_Nobara_Steam external drive`

Automatically mounts a **2TB NVMe M.2 external drive** (in a USB-C enclosure) formatted with **NTFS**. Useful for storing and launching Steam games directly.

```bash
# /etc/fstab: static file system information.
#
# Add this:
# change xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx with your drive's UUID
# BE VERY CAREFUL AND DOUBLE CHECK
# IF YOU MESS UP YOUR /etc/fstab YOUR SYSTEM MAY NOT BOOT

# m.2 with games
# To find the UUID of your drive, run:
#   sudo blkid

# Look for the line with your drive's device name (e.g. /dev/sdX or /dev/nvmeXn1pX)
# You can change /2tbmdot2 with whatever mount point you prefer
UUID=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx   /mnt/2tbmdot2  ntfs-3g  uid=1000,gid=1000,rw,exec,umask=000,nofail,x-gvfs-show  0  0

# Make sure /mnt/2tbmdot2 exists before rebooting:
#   sudo mkdir -p /mnt/2tbmdot2
```

> 🔧 Requires `ntfs-3g` to be installed for NTFS mounting.

---

### 📡 Other

* **`sshserver instrucions`**: Quick notes for setting up an SSH server on your system.

---

## 🛠 Setup Instructions

1. **Clone the repo**:

   ```bash
   git clone https://github.com/yourusername/MyNobaraDotFiles.git
   ```

2. **Copy or link** the configs, fonts, or themes you want to use.

3. **Apply themes** using GNOME Tweaks:

   * Set Shell: WhiteSur-Dark
   * Set Icons: MacTahoe
   * Set Cursor: Bibata Modern Classic

4. **Apply GNOME tweaks** by following the instructions in the `.txt` files.

5. **Mount drive**:

   * Update the UUID in the `fstab` snippet
   * Create the mount directory if it doesn’t exist
   * Reboot or run `sudo mount -a` to test

---

## 📌 Notes

* Configured for **Nobara Linux**, but most parts are portable to other GNOME/Fedora-based systems.
* Always back up critical configs like `/etc/fstab` before editing.

---

Would you like this saved as a `README.md` file now?
