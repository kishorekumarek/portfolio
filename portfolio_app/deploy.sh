#!/bin/bash

echo "🚀 Building Flutter Portfolio for Production..."

# Clean previous builds
flutter clean
flutter pub get

# Build for web with optimizations
flutter build web --release --web-renderer html --dart-define=FLUTTER_WEB_USE_SKIA=false

echo "✅ Build completed successfully!"
echo ""
echo "📁 Build files are located in: build/web/"
echo ""
echo "🧪 Test Production Build Locally:"
echo "   cd build/web && python3 -m http.server 8000"
echo "   Then visit: http://localhost:8000"
echo ""
echo "🌐 Deployment Options:"
echo "1. GitHub Pages: Copy build/web/* to gh-pages branch"
echo "2. Netlify: Drag build/web folder to netlify.com"
echo "3. Vercel: Run 'vercel --prod' in build/web directory"
echo "4. Custom Server: Upload build/web/* to your web server"
echo ""
echo "🔗 Your portfolio will be accessible at your chosen domain!" 