#!/bin/bash

echo "Checking KVM support..."
if [ -e /dev/kvm ]; then
    echo "✅ KVM available - Windows will run at good speed"
else
    echo "⚠️  No KVM - Windows will run slowly. Continuing anyway..."
    sed -i '/\/dev\/kvm/d' docker-compose.yml
    sed -i '/\/dev\/net\/tun/d' docker-compose.yml
fi

echo ""
echo "Starting Windows (Tiny11)..."
echo "This will take 30-60 minutes on first run (downloading + installing)"
echo "Subsequent starts take 2-3 minutes"
echo ""

docker compose up -d
echo ""
echo "✅ Container started!"
echo "👉 Open port 8006 from the PORTS tab above to see Windows in your browser"
echo ""
echo "Showing live logs (Ctrl+C to stop watching, Windows keeps running):"
docker compose logs -f
