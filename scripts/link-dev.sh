#!/bin/bash

# Development linking script for intelehealth-ayu-core
# This script helps set up local development with React/React Native apps

echo "🔗 Setting up intelehealth-ayu-core for local development..."

# Check if we're in the right directory
if [ ! -f "package.json" ] || [ ! -d "src" ]; then
    echo "❌ Error: Please run this script from the intelehealth-ayu-core root directory"
    exit 1
fi

# Build the library first
echo "📦 Building the library..."
yarn run build

if [ $? -ne 0 ]; then
    echo "❌ Build failed. Please fix the build errors first."
    exit 1
fi

# Create global link
echo "🔗 Creating global link..."
yarn link

if [ $? -eq 0 ]; then
    echo "✅ Library linked globally!"
    echo ""
    echo "📋 Next steps:"
    echo "1. Go to your React/React Native app directory"
    echo "2. Run: yarn link @intelehealth/intelehealth-ayu-core"
    echo "3. Start development:"
    echo "   - Library: yarn run dev (in intelehealth-ayu-core directory)"
    echo "   - Your app: yarn start (in your app directory)"
    echo ""
    echo "🔄 To unlink later:"
    echo "   - From your app: yarn unlink @intelehealth/intelehealth-ayu-core"
    echo "   - From library: yarn unlink"
else
    echo "❌ Failed to create global link"
    exit 1
fi
