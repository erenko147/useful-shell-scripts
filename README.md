# 🧰 Useful Shell Scripts / Kullanışlı Bash Scriptler

This repository contains simple yet helpful shell scripts which I created to automate small tasks while learning Unix scripting.  
Bu depo, Unix script yazımını öğrenirken küçük görevleri otomatikleştirmek amacıyla oluşturduğum basit ama faydalı shell scriptlerini içerir.

---

## 📜 Included Scripts / Dahil Olan Scriptler

### `install_script.sh`

**EN:**  
Installs one or more scripts to `$HOME/Scripts`, makes them executable with `chmod +x`, and adds the folder to your PATH via `.bashrc` or `.zshrc`, depending on your shell.

**TR:**  
Bir veya birden fazla scripti `$HOME/Scripts` dizinine kurar, `chmod +x` ile çalıştırılabilir hale getirir ve kullandığınız kabuğa bağlı olarak `.bashrc` veya `.zshrc` dosyanıza bu dizini PATH olarak ekler.

#### ✅ Features / Özellikler:

- ❗ If a script name already exists in your `PATH`, it will skip and warn you  
  ❗ Script ismi PATH içinde mevcutsa kurulum atlanır ve uyarı verilir
- 🔄 Prompts before overwriting an existing file in `$HOME/Scripts`  
  🔄 `$HOME/Scripts` klasöründe aynı isimde bir dosya varsa, üzerine yazmadan önce onay ister
- 🛑 Avoids copying a file over itself  
  🛑 Script zaten `$HOME/Scripts` içindeyse tekrar kopyalanmaz
- ✅ Updates your shell config **only if** at least one script was installed  
  ✅ En az bir script başarıyla kurulduysa, `.bashrc` veya `.zshrc` dosyasına PATH satırı eklenir
- 🐚 Supports both Bash and Zsh environments  
  🐚 Bash ve Zsh shell ortamları ile uyumludur

#### ✅ Usage / Kullanım:

```bash
install_script.sh script1.sh script2.sh ...
```

> 💡 You can pass as many scripts as you like.  
> 💡 İstediğiniz kadar script dosyasını aynı anda kurabilirsiniz.

> ✅ Tip: If you just downloaded the script, you can run it with `bash` for guaranteed execution:  
> ✅ İpucu: Scripti yeni indirdiyseniz, sorunsuz çalışması için şu şekilde çalıştırabilirsiniz:  
> `bash install_script.sh script1.sh`

---

### `brave_singletonlock_delete.sh`

**EN:**  
Removes the Brave browser lock file (`SingletonLock`) that sometimes prevents it from opening.

**TR:**  
Bazen Brave tarayıcısının açılmasını engelleyen `SingletonLock` adlı kilit dosyasını siler.

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

Then run / Daha sonra çalıştırın:

```bash
install_script.sh brave_singletonlock_delete.sh
```

Or download only one script / Ya da sadece tek bir script indirin:

```bash
wget https://raw.githubusercontent.com/erenko147/useful-shell-scripts/main/install_script.sh
bash install_script.sh
```

---

## 🧠 PATH Setup / PATH Ayarı

**EN:**  
The script adds the following block to your `.bashrc` or `.zshrc` file only if it doesn’t already exist:

**TR:**  
Script, aşağıdaki satırları `.bashrc` veya `.zshrc` dosyanıza sadece daha önce eklenmemişse otomatik olarak ekler:

```bash
# Add custom scripts path
if [[ ":$PATH:" != *":$HOME/Scripts:"* ]]; then
    export PATH="$HOME/Scripts:$PATH"
fi
```

This allows you to run your scripts globally from any terminal.  
Bu sayede scriptlerinizi terminalin herhangi bir yerinden çalıştırabilirsiniz.

If no supported shell config file is found, the script will warn you and print the block to be added manually.  
Eğer desteklenen bir shell yapılandırma dosyası bulunamazsa, script sizi uyarır ve elle eklemeniz gereken satırları gösterir.

---

## 🛠️ License / Lisans

**MIT License** – free to use, modify, and share.  
**MIT Lisansı** – kullanmakta, değiştirmekte ve paylaşmakta özgürsünüz.
