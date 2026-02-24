#!/bin/bash

# Contract Pipeline Check Script
# This script runs all checks that the CI/CD pipeline performs
# Run this before pushing to ensure your PR will pass

set -e  # Exit immediately if any command fails

echo "=========================================="
echo "Contract Pipeline Validation"
echo "=========================================="
echo ""

# Step 1: Format check
echo "🎨 Checking code formatting..."
cargo fmt --all -- --check
echo "✅ Format check passed"
echo ""

# Step 2: Clippy (linting)
echo "🔍 Running Clippy..."
cargo clippy --all-targets --all-features -- -D warnings
echo "✅ Clippy passed"
echo ""

# Step 3: Tests
echo "🧪 Running tests..."
cargo test --locked
echo "✅ Tests passed"
echo ""

# Step 4: Build WASM
echo "🏗️  Building WASM target..."
cargo build --target wasm32-unknown-unknown --release
echo "✅ WASM build successful"
echo ""

echo "=========================================="
echo "✅ All checks passed! Ready to push."
echo "=========================================="
