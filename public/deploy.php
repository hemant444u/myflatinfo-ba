<?php

$secret = 'myflatinfo-ba'; // Replace this with your actual GitHub webhook secret

$signature = $_SERVER['HTTP_X_HUB_SIGNATURE_256'] ?? '';
$payload = file_get_contents('php://input');

// Verify signature
$hash = 'sha256=' . hash_hmac('sha256', $payload, $secret);

if (!hash_equals($hash, $signature)) {
    http_response_code(403);
    file_put_contents(__DIR__ . '/deploy.log', "Invalid signature - " . date('Y-m-d H:i:s') . "\n", FILE_APPEND);
    exit('Invalid signature');
}

// Save the payload log (optional)
file_put_contents(__DIR__ . '/deploy-payload.json', $payload);

// Run auto-pull
exec('../git-autopull.sh >> ../deploy.log 2>&1 &');

http_response_code(200);
echo "Pull triggered securely.";