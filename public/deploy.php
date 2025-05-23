<?php

$secret = 'myflatinfo-ba'; // Your GitHub webhook secret
$signature = $_SERVER['HTTP_X_HUB_SIGNATURE_256'] ?? '';
$payload = file_get_contents('php://input');
$hash = 'sha256=' . hash_hmac('sha256', $payload, $secret);
$logPath = __DIR__ . '/deploy.log';

if (!hash_equals($hash, $signature)) {
    file_put_contents($logPath, "[".date('Y-m-d H:i:s')."] Invalid signature\n", FILE_APPEND);
    http_response_code(403);
    exit('Invalid signature');
}

// Run git commands
$cmd = <<<CMD
cd /var/www/html/myflatinfo-ba && \
git reset --hard HEAD && \
git pull origin main
CMD;

$output = shell_exec($cmd);

file_put_contents($logPath, "[".date('Y-m-d H:i:s')."] Webhook triggered\nCMD: $cmd\nOutput:\n$output\n\n", FILE_APPEND);

http_response_code(200);
echo "Deployed successfully";
