# NisitTrade Setup Guide

This document provides detailed setup instructions for the NisitTrade monorepo.

## ✅ What's Included

This repository contains a complete **React Native + Next.js + Tailwind CSS** setup with:

### 🌐 Web Application (`apps/web`)
- **Framework**: Next.js 16 with App Router
- **Language**: TypeScript
- **Styling**: Tailwind CSS v3.4
- **Key Features**:
  - Fast Refresh for development
  - Server-side rendering
  - Optimized production builds
  - ESLint configuration

### 📱 Mobile Application (`apps/mobile`)
- **Framework**: React Native (Expo SDK 54)
- **Language**: TypeScript
- **Styling**: NativeWind (Tailwind CSS for React Native)
- **Key Features**:
  - Cross-platform (iOS, Android, Web)
  - Hot reloading
  - TypeScript support
  - Native module support via Expo

### 📦 Shared Package (`packages/shared`)
- Common utilities and types
- Shared business logic
- Reusable across web and mobile

## 🚀 Quick Start

### Prerequisites
- Node.js 18+ and npm
- For iOS development: macOS with Xcode
- For Android development: Android Studio with SDK

### Installation

1. **Clone and install dependencies**:
```bash
git clone https://github.com/Hong-Layeang/NisitTrade.git
cd NisitTrade
npm install
```

This will install all dependencies for the entire monorepo using npm workspaces.

## 🛠️ Development

### Web Development

```bash
# Start Next.js dev server
npm run web

# Or from the web directory
cd apps/web
npm run dev
```

Visit `http://localhost:3000` to see your web app.

### Mobile Development

```bash
# Start Expo dev server
npm run mobile

# Or from the mobile directory
cd apps/mobile
npm start
```

Then:
- Press `a` to open on Android emulator
- Press `i` to open on iOS simulator (macOS only)
- Press `w` to open in web browser
- Scan the QR code with Expo Go app on your physical device

### Running Both Applications

Open two terminal windows:

**Terminal 1** (Web):
```bash
npm run web
```

**Terminal 2** (Mobile):
```bash
npm run mobile
```

## 🏗️ Building for Production

### Web Application

```bash
# Build for production
npm run web:build

# Start production server
npm run web:start
```

The production build will be in `apps/web/.next/`

### Mobile Application

For mobile builds, use Expo's build services:

```bash
cd apps/mobile

# Build for Android
npx expo build:android

# Build for iOS (requires Apple Developer account)
npx expo build:ios
```

Or use EAS Build (recommended):
```bash
# Install EAS CLI
npm install -g eas-cli

# Configure and build
eas build --platform android
eas build --platform ios
```

## 📁 Project Structure

```
NisitTrade/
├── apps/
│   ├── web/                 # Next.js web application
│   │   ├── app/            # App Router pages
│   │   │   ├── layout.tsx  # Root layout
│   │   │   ├── page.tsx    # Homepage
│   │   │   └── globals.css # Global styles
│   │   ├── public/         # Static assets
│   │   ├── tailwind.config.ts
│   │   ├── next.config.ts
│   │   └── package.json
│   │
│   └── mobile/             # React Native mobile app
│       ├── App.tsx         # Main app component
│       ├── assets/         # Images and fonts
│       ├── global.css      # NativeWind styles
│       ├── babel.config.js # Babel configuration
│       ├── tailwind.config.js
│       └── package.json
│
├── packages/
│   └── shared/             # Shared code
│       ├── index.ts        # Exports
│       └── package.json
│
├── package.json            # Root package.json
└── README.md
```

## 🎨 Styling with Tailwind CSS

Both applications use Tailwind CSS with a similar API:

### Web (Next.js)
```tsx
export default function Component() {
  return (
    <div className="flex items-center justify-center min-h-screen">
      <h1 className="text-4xl font-bold text-blue-600">
        Hello Web
      </h1>
    </div>
  );
}
```

### Mobile (React Native with NativeWind)
```tsx
import { View, Text } from 'react-native';
import './global.css';

export default function Component() {
  return (
    <View className="flex-1 items-center justify-center">
      <Text className="text-4xl font-bold text-blue-600">
        Hello Mobile
      </Text>
    </View>
  );
}
```

## 🔧 Configuration Files

### Web Configuration
- `tailwind.config.ts` - Tailwind CSS configuration
- `next.config.ts` - Next.js configuration
- `tsconfig.json` - TypeScript configuration
- `postcss.config.mjs` - PostCSS configuration

### Mobile Configuration
- `tailwind.config.js` - Tailwind configuration for NativeWind
- `babel.config.js` - Babel configuration with NativeWind plugin
- `app.json` - Expo configuration
- `tsconfig.json` - TypeScript configuration

## 📝 Adding New Features

### Adding a New Page (Web)
1. Create a new file in `apps/web/app/your-page/page.tsx`
2. Next.js automatically creates the route

### Adding a New Screen (Mobile)
1. Install a navigation library (e.g., React Navigation):
   ```bash
   cd apps/mobile
   npx expo install @react-navigation/native @react-navigation/native-stack
   ```
2. Create your screen component
3. Set up navigation in `App.tsx`

### Using Shared Code
```tsx
// In any app
import { APP_NAME, formatCurrency } from '@nisittrade/shared';
```

## 🧪 Testing

### Web Testing
```bash
cd apps/web
npm run lint        # Run ESLint
npm run build       # Verify build works
```

### Mobile Testing
```bash
cd apps/mobile
npx tsc --noEmit    # Type checking
npm run android     # Test on Android
npm run ios         # Test on iOS
```

## 🐛 Troubleshooting

### Web Issues

**Issue**: Tailwind classes not working
- **Solution**: Ensure `globals.css` is imported in `layout.tsx`
- Check that file paths are included in `tailwind.config.ts` content array

**Issue**: Build fails
- **Solution**: Clear Next.js cache: `rm -rf apps/web/.next`

### Mobile Issues

**Issue**: NativeWind classes not working
- **Solution**: Ensure `global.css` is imported in `App.tsx`
- Check that `nativewind/babel` is in `babel.config.js` plugins

**Issue**: Metro bundler cache issues
- **Solution**: Clear cache: `npx expo start -c`

**Issue**: Dependency conflicts
- **Solution**: In a monorepo, some peer dependency warnings are expected
- Use `--legacy-peer-deps` if needed

### Monorepo Issues

**Issue**: Module not found errors
- **Solution**: Run `npm install` from the root directory
- Ensure workspaces are properly configured in root `package.json`

## 📚 Learning Resources

- [Next.js Documentation](https://nextjs.org/docs)
- [React Native Documentation](https://reactnative.dev/)
- [Expo Documentation](https://docs.expo.dev/)
- [Tailwind CSS Documentation](https://tailwindcss.com/docs)
- [NativeWind Documentation](https://www.nativewind.dev/)

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

MIT License - see LICENSE file for details
