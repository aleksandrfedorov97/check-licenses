#!/usr/bin/env bash
set -e

PROJECT_LICENSE="$1"
WORKING_DIR="$2"

echo "🔎 Running LicenseFinder for license: '$PROJECT_LICENSE' in '$WORKING_DIR'"

POLICY_FILE="/doc/$PROJECT_LICENSE/dependency_decisions.yml"


if [ ! -f "$POLICY_FILE" ]; then
  echo "⚠️ Policy-file '$POLICY_FILE' not found."
  exit 1
fi

echo "✅ Using decisions file: '$POLICY_FILE'"

echo "📂 Listing files in working directory:"
ls -la "$WORKING_DIR"

cd "$WORKING_DIR"

license_finder --decisions-file "$POLICY_FILE"