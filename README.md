# 🧰 Useful Shell Scripts / Kullanışlı Bash Scriptler

This repository contains simple yet helpful shell scripts which I created to automate small tasks while learning Unix scripting.  
Bu depo, günlük hayatta işe çok da yaramayacak fakat kendimi Unix script üzerinde geliştirmek ve karşılaştığım sorunlardan kurtulmak için geliştirdiğim scriptleri içerir.

---

## 📜 Included Scripts / Dahil Olan Scriptler

### `install_script.sh`

**EN:**  
Installs one or more scripts to `$HOME/Scripts`, makes them executable with `chmod +x`, and adds the folder to your PATH automatically.

**TR:**  
Bir veya birden fazla scripti `$HOME/Scripts` dizinine kurar, `chmod +x` ile çalıştırılabilir hale getirir ve otomatik olarak PATH'e ekler.

#### ✅ Usage / Kullanım:

```bash
install_script.sh script1.sh script2.sh ...
```

You can pass as many scripts as you like.  
İstediğiniz kadar script dosyasını aynı anda kurabilirsiniz.

> 💡 By adding `bash` prior to the command you can ensure it runs regardless of permissions:  
> 💡 Aynı zamanda başına `bash` ekleyerek garanti çalıştırabilirsiniz:  
> `bash install_script.sh script1.sh`

---

### `brave_singletonlock_delete.sh`

**EN:**  
Removes the Brave browser lock file (`SingletonLock`) that sometimes prevents it from opening.

**TR:**  
Brave tarayıcısının açılmasını engelleyen `SingletonLock` dosyasını siler.

```bash
brave_singletonlock_delete.sh
```

---

## 📥 How to Download / Nasıl İndirilir

Clone the repo / Depoyu klonlayın:

```bash
git clone https://github.com/erenko147/useful-shell-scripts.git
cd useful-shell-scripts
```

Then run:

```bash
install_script.sh brave_singletonlock_delete.sh
```

Or download only one script / Veya sadece bir script indirin:

```bash
wget https://raw.githubusercontent.com/erenko147/useful-shell-scripts/main/install_script.sh
bash install_script.sh
```

---

## 🧠 PATH Setup (Automatically Done) / PATH Ayarı (Otomatik)

The installer script adds this line to your `.bashrc` if not already present:  
Kurulum scripti `.bashrc` dosyasına aşağıdaki satırı ekler:

```bash
export PATH="$HOME/Scripts:$PATH"
```

This allows you to run your scripts globally from any terminal.  
Böylece scriptleri her yerden terminal ile çalıştırabilirsiniz.

---

## 🛠️ License / Lisans

**MIT License** – free to use, modify, and share.  
**MIT Lisansı** – kullanmakta, düzenlemekte ve paylaşmakta özgürsünüz.
