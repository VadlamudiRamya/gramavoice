# 📤 Push to GitHub - Step by Step Guide

## 🎯 Quick Steps

### Step 1: Create GitHub Repository

1. **Go to GitHub**: [github.com](https://github.com)
2. **Sign in** (or create account)
3. **Click "+"** (top right) → **"New repository"**
4. **Fill in**:
   - **Repository name**: `gramavoice`
   - **Description**: `Citizen Complaint Management System`
   - **Visibility**: Public (or Private)
   - **DO NOT** check "Add a README file" (we already have one)
   - **DO NOT** check "Add .gitignore" (we already have one)
5. **Click "Create repository"**

### Step 2: Copy Repository URL

After creating, GitHub will show you a page. Copy the HTTPS URL:
```
https://github.com/YOUR_USERNAME/gramavoice.git
```

### Step 3: Push Your Code

**Option A: Use the Script (Easiest)**
1. Double-click `push-to-github.bat`
2. Paste your GitHub repository URL when prompted
3. Enter your GitHub username when asked
4. Enter your GitHub password/token when asked

**Option B: Manual Commands**

Open PowerShell in your project folder and run:

```bash
# Add GitHub repository (replace with YOUR repository URL)
git remote add origin https://github.com/YOUR_USERNAME/gramavoice.git

# Rename branch to main
git branch -M main

# Push code
git push -u origin main
```

### Step 4: Authentication

When you run `git push`, you'll be asked for:
- **Username**: Your GitHub username
- **Password**: Use a **Personal Access Token** (not your GitHub password)

#### How to Create Personal Access Token:

1. Go to GitHub → **Settings** (click your profile picture)
2. Scroll down → **Developer settings**
3. Click **Personal access tokens** → **Tokens (classic)**
4. Click **Generate new token** → **Generate new token (classic)**
5. Fill in:
   - **Note**: `GramaVoice Deployment`
   - **Expiration**: Choose (90 days recommended)
   - **Scopes**: Check `repo` (full control of private repositories)
6. Click **Generate token**
7. **Copy the token** (you'll only see it once!)
8. Use this token as your password when pushing

---

## ✅ Verify Push

After pushing, check GitHub:
1. Go to your repository: `https://github.com/YOUR_USERNAME/gramavoice`
2. You should see all your files:
   - `package.json`
   - `server.js`
   - `public/` folder
   - etc.

---

## 🔧 Troubleshooting

### "Repository not found"
- Make sure you created the repository on GitHub first
- Check the URL is correct

### "Authentication failed"
- Use Personal Access Token (not password)
- Make sure token has `repo` scope

### "Remote already exists"
- Remove it: `git remote remove origin`
- Then add again with correct URL

### "Permission denied"
- Check repository visibility (Public vs Private)
- Verify you have write access

---

## 🚀 After Pushing to GitHub

Once code is on GitHub:
1. Go back to Render.com
2. In your service settings, refresh/connect repository
3. Make sure Root Directory is empty (or `.`)
4. Click "Manual Deploy" → "Deploy latest commit"

---

**Need help?** Let me know which step you're stuck on!

