# ⚡ Quick Deployment Steps

## 🚀 Deploy to Render.com (Easiest - Free)

### 1️⃣ Prepare Your Code
```bash
# Make sure you have Git initialized
git status

# If not initialized:
git init
git add .
git commit -m "Ready for deployment"
```

### 2️⃣ Push to GitHub
```bash
# Create a new repository on GitHub first, then:
git remote add origin https://github.com/YOUR_USERNAME/gramavoice.git
git branch -M main
git push -u origin main
```

### 3️⃣ Deploy on Render

1. **Sign up**: Go to [render.com](https://render.com) → Sign up with GitHub

2. **Create Web Service**:
   - Click "New +" → "Web Service"
   - Connect your GitHub repository
   - Select the `gramavoice` repository

3. **Configure Service**:
   - **Name**: `gramavoice` (or your choice)
   - **Environment**: `Node`
   - **Region**: Choose closest to you
   - **Branch**: `main`
   - **Root Directory**: (leave empty)
   - **Build Command**: `npm install`
   - **Start Command**: `node server.js`
   - **Plan**: Free

4. **Set Environment Variables** (Click "Advanced"):
   ```
   NODE_ENV = production
   PORT = 5000
   MONGODB_URI = (get from MongoDB Atlas - see below)
   JWT_SECRET = (generate a long random string)
   ```

5. **Create MongoDB Database**:
   - Option A: Use MongoDB Atlas (Free)
     - Go to [mongodb.com/cloud/atlas](https://www.mongodb.com/cloud/atlas)
     - Create free account
     - Create cluster (free M0)
     - Click "Connect" → "Connect your application"
     - Copy connection string
     - Replace `<password>` with your database password
     - Add to Render as `MONGODB_URI`
   
   - Option B: Render MongoDB (Easier)
     - In Render dashboard: "New +" → "MongoDB"
     - Name: `gramavoice-db`
     - Plan: Free
     - Copy "Internal Database URL"
     - Add to web service as `MONGODB_URI`

6. **Deploy**: Click "Create Web Service"

7. **Wait**: First deployment takes 5-10 minutes

### 4️⃣ Access Your App

After deployment, you'll get a URL like:
`https://gramavoice.onrender.com`

---

## 🔐 Generate JWT Secret

Generate a secure JWT secret:
```bash
node -e "console.log(require('crypto').randomBytes(64).toString('hex'))"
```

Copy the output and use it as `JWT_SECRET` in Render.

---

## ✅ Test Deployment

1. Visit your Render URL
2. Register a new account
3. Test file upload
4. Test language switching
5. Check both dashboards

---

## 📝 Important Notes

- **First deployment**: Takes 5-10 minutes
- **Free tier**: Sleeps after 15 minutes of inactivity (wakes up when accessed)
- **File uploads**: Files are stored in `/uploads` (persist on Render)
- **Environment variables**: Never commit `.env` to Git (already in .gitignore)

---

## 🐛 Common Issues

### "Cannot connect to MongoDB"
- Verify `MONGODB_URI` is set correctly in Render
- Check MongoDB Atlas Network Access (allow all IPs: 0.0.0.0/0)

### "Application Error"
- Check Render logs (Logs tab)
- Verify all environment variables are set
- Ensure `npm install` completed successfully

### File uploads not working
- `/uploads` directory is created automatically
- Check file size limits (50MB max)

---

## 🎉 Done!

Your app is now live! Share the URL with users.

**Need help?** Check Render dashboard → Logs tab for error messages.

