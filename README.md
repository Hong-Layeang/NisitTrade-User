# NisitTrade

A complete monorepo setup with **React Native** + **Next.js** + **Tailwind CSS**.

## 🏗️ Project Structure

```
NisitTrade/
├── apps/
│   ├── web/              # Next.js web application
│   │   ├── app/          # Next.js App Router pages
│   │   ├── public/       # Static assets
│   │   └── package.json
│   └── mobile/           # React Native mobile application
│       ├── App.tsx       # Main mobile app component
│       ├── global.css    # Tailwind styles for mobile
│       └── package.json
├── packages/
│   └── shared/           # Shared code between apps
│       ├── index.ts      # Shared utilities and types
│       └── package.json
└── package.json          # Root package.json (workspace config)
```

## ✨ Features

- **Web App**: Next.js 16 with TypeScript, App Router, and Tailwind CSS
- **Mobile App**: React Native (Expo) with TypeScript and NativeWind (Tailwind CSS for React Native)
- **Monorepo**: npm workspaces for managing multiple packages
- **Shared Code**: Common utilities and types shared between web and mobile
- **Styling**: Tailwind CSS for both web and mobile (via NativeWind)

## 🚀 Getting Started

### Prerequisites

- Node.js 18+ and npm
- For iOS development: macOS with Xcode
- For Android development: Android Studio

### Installation

1. Clone the repository:
```bash
git clone https://github.com/Hong-Layeang/NisitTrade.git
cd NisitTrade
```

2. Install dependencies (from root):
```bash
npm install
```

This will install dependencies for all workspaces (web, mobile, and shared packages).

## 📱 Running the Applications

### Web Application

```bash
# Development mode
npm run web

# Build for production
npm run web:build

# Start production server
npm run web:start
```

The web app will be available at `http://localhost:3000`

### Mobile Application

```bash
# Start Expo dev server
npm run mobile

# Run on Android
cd apps/mobile && npm run android

# Run on iOS (macOS only)
cd apps/mobile && npm run ios

# Run on web
cd apps/mobile && npm run web
```

You can scan the QR code with the Expo Go app on your phone to test on a physical device.

## 🛠️ Technology Stack

### Web (Next.js)
- **Next.js 16**: React framework with App Router
- **React 19**: UI library
- **TypeScript**: Type safety
- **Tailwind CSS**: Utility-first CSS framework
- **ESLint**: Code linting

### Mobile (React Native)
- **Expo 54**: React Native platform
- **React Native 0.81**: Mobile framework
- **TypeScript**: Type safety
- **NativeWind**: Tailwind CSS for React Native

## 📦 Workspace Commands

The root `package.json` provides convenient scripts:

- `npm run web` - Start Next.js dev server
- `npm run mobile` - Start Expo dev server
- `npm run web:build` - Build Next.js for production
- `npm run web:start` - Start Next.js production server

## 🎨 Styling

Both applications use Tailwind CSS:

- **Web**: Standard Tailwind CSS configured via `postcss.config.mjs`
- **Mobile**: NativeWind configured via `babel.config.js` and `tailwind.config.js`

Example of shared styling approach:
```tsx
// Web (Next.js)
<div className="flex min-h-screen items-center justify-center">
  <h1 className="text-4xl font-bold text-blue-600">Hello</h1>
</div>

// Mobile (React Native with NativeWind)
<View className="flex-1 items-center justify-center">
  <Text className="text-4xl font-bold text-blue-600">Hello</Text>
</View>
```

## 📝 Development Tips

1. **Code Sharing**: Place shared utilities in `packages/shared/`
2. **Mobile Testing**: Use Expo Go app for quick testing on real devices
3. **Web Hot Reload**: Next.js provides fast refresh during development
4. **Type Safety**: Both apps use TypeScript for better developer experience

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## 📄 License

MIT