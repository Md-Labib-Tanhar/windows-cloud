#!/bin/bash
echo "Starting macOS container..."
docker compose up -d
echo ""
echo "✅ Started! Open port 8006 from the PORTS tab"
echo "⚠️  First run takes 60-90 mins to download and install macOS"
echo ""
docker compose logs -f
