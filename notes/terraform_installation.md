To install **Terraform on your own computer**, not on the cloud. Here is **step-by-step**, assuming you're on Linux. If you're using macOS or Windows, the instruction are also here.

---

## 🐧 How to Install Terraform on Linux (Ubuntu/Debian)

### ✅ Step 1: Update your system

```bash
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
```

---

### ✅ Step 2: Add the HashiCorp GPG key

```bash
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
```

---

### ✅ Step 3: Add the HashiCorp Linux repo

```bash
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
```

---

### ✅ Step 4: Install Terraform

```bash
sudo apt update
sudo apt install terraform
```

---

### ✅ Step 5: Verify

```bash
terraform -version
```

You should see something like:

```
Terraform v1.8.0
```

---

Let me know your operating system if you’re not on Linux — I’ll give you the exact commands for Windows or macOS too.
# 1. Update your system
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl

# 2. Add the HashiCorp GPG key
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

# 3. Add the HashiCorp repo
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

# 4. Update again and install Terraform
sudo apt update
sudo apt install terraform

# 5. Verify installation
terraform -version
Great! Here's how to install **Terraform** on **macOS** and **Windows**, clearly and step-by-step:

---

## 🍎 macOS — Install Terraform

### ✅ Option 1: Using Homebrew (recommended)

```bash
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```

### ✅ Verify installation:

```bash
terraform -version
```

---

### 🧹 To Upgrade:

```bash
brew upgrade hashicorp/tap/terraform
```

> ✅ Requires [Homebrew](https://brew.sh) — if you don’t have it:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

---

## 🪟 Windows — Install Terraform

### ✅ Option 1: Using Windows Package Manager (Winget)

```powershell
winget install HashiCorp.Terraform
```

> ✅ Requires Windows 10/11 with **winget** available
> You may be prompted to approve installation.

---

### ✅ Option 2: Manual Download

1. Go to: [https://developer.hashicorp.com/terraform/downloads](https://developer.hashicorp.com/terraform/downloads)
2. Download the Windows ZIP for your system (x64 or ARM)
3. Extract it somewhere (e.g., `C:\Terraform`)
4. Add that folder to your **System PATH**:

   * Open **Environment Variables**
   * Edit `PATH`, add `C:\Terraform`
5. Open a new terminal (Command Prompt or PowerShell) and run:

```powershell
terraform -version
```

---

### ✅ You're Ready!

Once installed, `terraform` is available in your terminal or PowerShell just like on Linux/macOS.


