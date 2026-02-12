# 🗣️ GramaVoice - Citizen Complaint Management System

A full-stack web application built with Node.js, Express, MongoDB, and vanilla JavaScript for managing citizen complaints with role-based dashboards for citizens and government officials.

## ✨ Features

### 👤 Citizen Features
- **User Authentication**: Register and login with email/password
- **Report Issues**: Submit complaints with title, description, category, location, and media
- **View Issues**: Browse all issues with filtering by location
- **Like & Comment**: Support issues and add comments
- **My Reports**: View all issues you've reported
- **Location-based Filtering**: See issues from your village/area first

### 🏛️ Government Official Features
- **Separate Login Portal**: Secure government official access
- **Priority Sorting**: View issues sorted by likes (urgency), newest, or location
- **Real-time Notifications**: Get instant alerts when new complaints are submitted
- **Status Management**: Update issue status (Reported → Under Review → In Progress → Resolved)
- **Officer Assignment**: Assign officials and add remarks to issues
- **Advanced Filtering**: Filter by location, category, and status
- **Dashboard Statistics**: View overview of all issues

## 🛠️ Tech Stack

- **Backend**: Node.js, Express.js
- **Database**: MongoDB with Mongoose
- **Real-time**: Socket.IO
- **Authentication**: JWT (JSON Web Tokens)
- **Security**: bcryptjs for password hashing
- **Frontend**: HTML5, CSS3, Vanilla JavaScript

## 📋 Prerequisites

- Node.js (v14 or higher)
- MongoDB (installed and running)
- npm or yarn

## 🚀 Installation & Setup

1. **Clone the repository**
```bash
git clone <your-repo-url>
cd gramavoice
```

2. **Install dependencies**
```bash
npm install
```

3. **Configure environment variables**
```bash
# Create a .env file in the root directory
PORT=5000
MONGODB_URI=mongodb://localhost:27017/gramavoice
JWT_SECRET=your-secret-key-change-this-to-a-long-random-string
```

4. **Start MongoDB**
```bash
# Make sure MongoDB is running on your system
# On Windows:
mongod

# On macOS/Linux:
sudo systemctl start mongod
```

5. **Run the application**
```bash
# Development mode with auto-reload
npm run dev

# Production mode
npm start
```

6. **Access the application**
- Open your browser and navigate to: `http://localhost:5000`

## 📁 Project Structure

```
gramavoice/
├── models/
│   ├── User.js          # User schema with role-based access
│   └── Issue.js         # Issue/complaint schema
├── routes/
│   ├── auth.js          # Authentication routes (login, register)
│   ├── citizen.js       # Citizen-specific routes
│   └── government.js    # Government official routes
├── middleware/
│   └── auth.js          # JWT authentication & role-based access control
├── public/
│   ├── css/
│   │   ├── login.css    # Login page styles
│   │   ├── citizen.css  # Citizen dashboard styles
│   │   └── gov.css      # Government dashboard styles
│   ├── js/
│   │   ├── auth.js      # Authentication logic
│   │   ├── citizen-dashboard.js  # Citizen dashboard logic
│   │   └── gov-dashboard.js      # Government dashboard logic
│   ├── login.html       # Login/Register page
│   ├── citizen-dashboard.html    # Citizen dashboard
│   └── gov-dashboard.html        # Government dashboard
├── server.js            # Main server file
├── package.json
├── .env
└── README.md
```

## 🔐 User Roles

### Citizen Role
- Can register and create an account
- Can report issues in their area
- Can view and filter all issues
- Can like and comment on issues
- Can view their own submitted reports

### Government Role
- Separate registration/login portal
- Can view all issues with advanced filtering
- Can update issue status
- Can assign officers to issues
- Receives real-time notifications for new issues
- Access to dashboard statistics

## 🎨 Key Features

### Location-based Filtering
- Issues are tagged with village/area names
- Citizens can filter to see local issues first
- Government officials can sort by location

### Like-based Prioritization
- Citizens can like issues they support
- Government dashboard automatically prioritizes most liked issues
- Real-time like counts displayed on all dashboards

### Real-time Notifications
- Government officials receive instant alerts for new issues
- Powered by Socket.IO for live updates
- Visual notifications with pulse animations

### Status Workflow
- **Reported**: Initial complaint submission
- **Under Review**: Being assessed by officials
- **In Progress**: Work has begun on the issue
- **Resolved**: Issue has been fixed

## 🔒 Security Features

- JWT-based authentication
- Password hashing with bcryptjs
- Role-based access control
- Protected API routes
- Session management with localStorage

## 📱 Responsive Design

The application features a clean, modern UI with:
- Soft pastel color scheme
- Minimalistic design
- Smooth animations and transitions
- Mobile-friendly layouts

## 🧪 Testing

1. **Register a Citizen Account**
   - Go to `http://localhost:5000`
   - Click "Citizen Login" tab
   - Register with your details

2. **Register a Government Account**
   - Click "Government Login" tab
   - Register as government official

3. **Test Features**
   - Submit issues as citizen
   - View and manage issues as government official
   - Test real-time notifications

## 🐛 Troubleshooting

**MongoDB Connection Error**
- Ensure MongoDB is installed and running
- Check your `MONGODB_URI` in `.env` file

**Port Already in Use**
- Change `PORT` in `.env` file
- Or kill the process using port 5000

**Socket.IO Connection Issues**
- Ensure you're accessing via `http://localhost:5000` (not file://)
- Check browser console for WebSocket errors

## 📝 API Endpoints

### Authentication
- `POST /api/auth/register` - Register new user
- `POST /api/auth/login` - Login user

### Citizen Routes
- `GET /api/issues` - Get all issues
- `POST /api/issues` - Create new issue
- `GET /api/my-issues/:userId` - Get user's issues
- `POST /api/issues/:id/like` - Like/unlike issue
- `POST /api/issues/:id/comment` - Add comment

### Government Routes
- `GET /api/gov/issues` - Get all issues (filtered)
- `GET /api/gov/stats` - Get dashboard statistics
- `PATCH /api/gov/issues/:id/status` - Update issue status
- `PATCH /api/gov/issues/:id/assign` - Assign officer

## 🚀 Deployment

For production deployment:

1. Update `.env` with production MongoDB URI
2. Change `JWT_SECRET` to a strong random string
3. Set `NODE_ENV=production`
4. Use a process manager like PM2
5. Configure reverse proxy with Nginx
6. Enable HTTPS

## 📄 License

This project is licensed under the ISC License.

## 👥 Contributing

Contributions, issues, and feature requests are welcome!

## 🙏 Acknowledgments

- Built with Express.js and MongoDB
- Real-time features powered by Socket.IO
- UI designed with modern CSS best practices

---

**Made with ❤️ for better citizen-government communication**

