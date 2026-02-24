#!/bin/bash

# Frontend Pipeline Check Script
# This script runs all checks that the CI/CD pipeline performs
# Run this before pushing to ensure your PR will pass

set -e  # Exit immediately if any command fails

echo "=========================================="
echo "Frontend Pipeline Validation"
echo "=========================================="
echo ""

# Step 1: Install dependencies
echo "📦 Installing dependencies..."
pnpm install --frozen-lockfile
echo "✅ Dependencies installed"
echo ""

# Step 2: Format check
echo "🎨 Checking code formatting..."
pnpm run format:check
echo "✅ Format check passed"
echo ""

# Step 3: Lint
echo "🔍 Running ESLint..."
pnpm run lint
echo "✅ Linting passed"
echo ""

# Step 4: Build
echo "🏗️  Building project..."
pnpm run build
echo "✅ Build successful"
echo ""

echo "=========================================="
echo "✅ All checks passed! Ready to push."
echo "=========================================="
