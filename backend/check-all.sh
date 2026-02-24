#!/bin/bash

# Backend Pipeline Check Script
# This script runs all checks that the CI/CD pipeline performs
# Run this before pushing to ensure your PR will pass

set -e  # Exit immediately if any command fails

echo "=========================================="
echo "Backend Pipeline Validation"
echo "=========================================="
echo ""

# Step 1: Install dependencies
echo "📦 Installing dependencies..."
pnpm install --frozen-lockfile
echo "✅ Dependencies installed"
echo ""

# Step 2: Format check
echo "🎨 Checking code formatting..."
npx prettier --check "src/**/*.ts" "test/**/*.ts"
echo "✅ Format check passed"
echo ""

# Step 3: Lint
echo "🔍 Running ESLint..."
pnpm run lint
echo "✅ Linting passed"
echo ""

# Step 4: Type checking
echo "📝 Running TypeScript type checking..."
npx tsc --noEmit
echo "✅ Type checking passed"
echo ""

# Step 5: Tests
echo "🧪 Running unit tests..."
pnpm run test
echo "✅ Tests passed"
echo ""

# Step 6: Build
echo "🏗️  Building project..."
pnpm run build
echo "✅ Build successful"
echo ""

echo "=========================================="
echo "✅ All checks passed! Ready to push."
echo "=========================================="
