# 🧰 Useful Shell Scripts / Kullanışlı Bash Scriptler

This repository contains simple yet helpful shell scripts which I created to automate small tasks while learning Unix scripting.  
Bu depo, Unix betik yazımını öğrenirken küçük görevleri otomatikleştirmek amacıyla oluşturduğum basit ama faydalı betikler içerir.

---

## 📜 Included Scripts / Dahil Olan betikler

### `install_script.sh`

**EN:**  
Installs one or more scripts to `$HOME/Scripts`, makes them executable with `chmod +x`, and adds the folder to your PATH via `.bashrc` or `.zshrc`, depending on your shell.

**TR:**  
Bir veya birden fazla betiği `$HOME/Scripts` dizinine kurar, `chmod +x` ile çalıştırılabilir hale getirir ve kullandığınız kabuğa bağlı olarak `.bashrc` veya `.zshrc` dosyanıza bu dizini PATH olarak ekler.

#### ✅ Features / Özellikler:

- ❗ If a script name already exists in your `PATH`, it will skip and warn you  
  ❗ Betik ismi PATH içinde mevcutsa kurulum atlanır ve uyarı verilir
- 🔄 Prompts before overwriting an existing file in `$HOME/Scripts`  
  🔄 `$HOME/Scripts` klasöründe aynı isimde bir dosya varsa, üzerine yazmadan önce onay ister
- 🛑 Avoids copying a file over itself  
  🛑 Betik zaten `$HOME/Scripts` içindeyse tekrar kopyalanmaz
- ✅ Updates your shell config **only if** at least one script was installed  
  ✅ En az bir betik başarıyla kurulduysa, `.bashrc` veya `.zshrc` dosyasına PATH satırı eklenir
- 🐚 Supports both Bash and Zsh environments  
  🐚 Bash ve Zsh shell ortamları ile uyumludur

#### ✅ Usage / Kullanım:

```bash
install_script.sh script1.sh script2.sh ...
```

> 💡 You can pass as many scripts as you like.  
> 💡 İstediğiniz kadar betik dosyasını aynı anda kurabilirsiniz.

> ✅ Tip: If you just downloaded the script, you can run it with `bash` for guaranteed execution:  
> ✅ İpucu: Betiği yeni indirdiyseniz, sorunsuz çalışması için şu şekilde çalıştırabilirsiniz:  
> `bash install_script.sh script1.sh`

---

### `brave_singletonlock_delete.sh`

**EN:**  
Removes the Brave browser lock file (`SingletonLock`) that ,when closed improperly, prevents brave from opening.

**TR:**  
Hatalı bir şekilde uygulamadan çıkıldığında Brave tarayıcısının açılmasını engelleyen `SingletonLock` adlı kilit dosyasını siler.

```bash
brave_singletonlock_delete.sh
```

---


### `travel_charge.sh`

**EN:**  
This script temporarily sets your laptop battery to charge to 100% instead of the usual 80% limit, giving you maximum battery capacity for travel or extended unplugged use. 
Note: This script only works on laptops that support battery charge thresholds through sysfs (like Huawei laptop and some ThinkPads, etc.) - it won't work on all laptop brands.

**TR:**  
Bu betik, seyahat veya uzun süre prizden bağımsız kullanım için maksimum pil kapasitesi sağlamak amacıyla laptop pilinizi geçici olarak normal %80 sınırı yerine %100'e kadar şarj edilecek şekilde ayarlar. 
Not: Bu betik sadece sysfs üzerinden pil şarj eşiklerini destekleyen laptoplarda çalışır (huawei ve bazı ThinkPad'ler gibi) - tüm laptop markalarında çalışmaz.

```bash
travel_charge.sh
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

or

curl -o install_script.sh https://raw.githubusercontent.com/erenko147/useful-shell-scripts/main/install_script.sh
bash install_script.sh

or

curl -s https://raw.githubusercontent.com/erenko147/useful-shell-scripts/main/install_script.sh | bash
```

**EN:**
If you dont download install_script.sh you will have to manually manage your scripts whereabouts and their permissions. 

**TR:**
Eğer install_script.sh dosyasını indirmezseniz, betiklerinizin yerini ve izinlerini manuel olarak yönetmeniz gerekecektir.

---

## 🧠 PATH Setup / PATH Ayarı

**EN:**  
The script adds the following block to your `.bashrc` or `.zshrc` file only if it doesn’t already exist:

**TR:**  
Betik, aşağıdaki satırları `.bashrc` veya `.zshrc` dosyanıza sadece daha önce eklenmemişse otomatik olarak ekler:

```bash
# Add custom scripts path
if [[ ":$PATH:" != *":$HOME/Scripts:"* ]]; then
    export PATH="$HOME/Scripts:$PATH"
fi
```

This allows you to run your scripts globally from any terminal.  
Bu sayede betiklerinizi terminalin herhangi bir yerinden çalıştırabilirsiniz.

If no supported shell config file is found, the script will warn you and print the block to be added manually.  
Eğer desteklenen bir shell yapılandırma dosyası bulunamazsa, betik sizi uyarır ve manuel eklemeniz gereken satırları gösterir.

---

## 🛠️ License / Lisans

**MIT License** – free to use, modify, and share.  
**MIT Lisansı** – kullanmakta, değiştirmekte ve paylaşmakta özgürsünüz.
