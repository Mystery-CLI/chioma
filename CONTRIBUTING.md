# Contributing to Chioma

Thank you for your interest in contributing to Chioma! We welcome contributions from the community to help make rental payments transparent, low-cost, and programmable.

## Table of Contents

- [Introduction](#introduction)
- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
- [Development Workflow](#development-workflow)
  - [Backend (NestJS)](#backend-nestjs)
  - [Frontend (Next.js)](#frontend-nextjs)
  - [Smart Contracts (Soroban)](#smart-contracts-soroban)
- [Local Pipeline Validation](#local-pipeline-validation)
- [Code Style](#code-style)
- [Pull Request Process](#pull-request-process)

## Introduction

Chioma is an open-source platform on the Stellar blockchain connecting landlords, agents, and tenants. It uses a hybrid architecture with on-chain settlement and off-chain business logic.

## Prerequisites

Ensure you have the following installed:

-   **Node.js** (v20+ recommended)
-   **pnpm** (v9+ recommended)
-   **Rust** (latest stable)
-   **Soroban CLI** (latest version compatible with Stellar network)
-   **Docker** (optional, for running local databases)

## Getting Started

1.  **Clone the repository**:
    ```bash
    git clone https://github.com/caxtonacollins/chioma.git
    cd chioma
    ```

2.  **Install dependencies**:
    Navigate to the backend and frontend directories and run:
    ```bash
    cd backend && pnpm install
    cd ../frontend && pnpm install
    ```

3.  **Set up Environment Variables**:
    -   **Backend**: Copy `.env.example` to `.env` in `backend/` and configure your database and Stellar credentials.
    -   **Frontend**: Copy `.env.example` (if available) or create `.env.local` in `frontend/` with necessary API endpoints.

## Development Workflow

### Backend (NestJS)

Located in `backend/`.

-   **Run in development mode**:
    ```bash
    cd backend
    pnpm start:dev
    ```
-   **Run tests**:
    ```bash
    pnpm test
    ```
-   **Lint code**:
    ```bash
    pnpm lint
    ```

### Frontend (Next.js)

Located in `frontend/`.

-   **Run in development mode**:
    ```bash
    cd frontend
    pnpm dev
    ```
-   **Build for production**:
    ```bash
    pnpm build
    ```
-   **Lint code**:
    ```bash
    pnpm lint
    ```

### Smart Contracts (Soroban)

Located in `contract/`.

-   **Build contracts**:
    ```bash
    cd contract
    cargo build
    ```
-   **Run tests**:
    ```bash
    cargo test
    ```
-   **Format code**:
    ```bash
    cargo fmt
    ```

## Local Pipeline Validation

Before submitting a pull request, you should run the local validation scripts to ensure your code will pass all CI/CD checks. Each sub-project has a `check-all.sh` script that mirrors the exact steps performed by GitHub Actions.

### Running Validation Scripts

**Frontend:**
```bash
cd frontend
./check-all.sh
```

This script will:
1. Install dependencies with `pnpm install --frozen-lockfile`
2. Check code formatting with `pnpm run format:check`
3. Run ESLint with `pnpm run lint`
4. Build the project with `pnpm run build`

**Backend:**
```bash
cd backend
./check-all.sh
```

This script will:
1. Install dependencies with `pnpm install --frozen-lockfile`
2. Check code formatting with Prettier
3. Run ESLint with `pnpm run lint`
4. Run TypeScript type checking with `tsc --noEmit`
5. Run unit tests with `pnpm run test`
6. Build the project with `pnpm run build`

**Contract:**
```bash
cd contract
./check-all.sh
```

This script will:
1. Check code formatting with `cargo fmt --all -- --check`
2. Run Clippy linter with `cargo clippy --all-targets --all-features -- -D warnings`
3. Run tests with `cargo test --locked`
4. Build WASM target with `cargo build --target wasm32-unknown-unknown --release`

### Why Use These Scripts?

Running these scripts locally helps you:
- ✅ Catch issues before pushing to GitHub
- ✅ Reduce CI/CD pipeline failures
- ✅ Speed up the review process
- ✅ Ensure consistent code quality

**Note:** On Windows, you may need to run these scripts using Git Bash or WSL. Alternatively, you can run the individual commands listed above manually.

## Code Style

-   **JavaScript/TypeScript**: We use **Prettier** and **ESLint**. Run `pnpm format` or `pnpm lint` before committing.
-   **Rust**: We use **Rustfmt**. Run `cargo fmt` before committing.

## Pull Request Process

1.  Fork the repository and create a new branch for your feature or fix.
2.  **Run the validation script** for your sub-project (`./check-all.sh`) to ensure all checks pass locally.
3.  Ensure all tests pass and code follows our style guidelines.
4.  Submit a Pull Request (PR) with a clear description of your changes.
5.  Link any relevant issues in your PR description.
6.  Wait for review and address any feedback.

**Before submitting your PR, make sure:**
- ✅ You've run the appropriate `check-all.sh` script
- ✅ All tests pass
- ✅ Code is properly formatted
- ✅ No linting errors
- ✅ Build succeeds

Thank you for contributing to Chioma!
