#!/bin/bash
# Make bash stop on errors and log what's the problem
set -euxo pipefail

# Install Apache
dnf install -y httpd

# Create the website
cat > /var/www/html/index.html <<'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Northlayer Consulting</title>
</head>
<body>
  <h1>Northlayer Consulting</h1>
  <p>This is NLC-Web-02.</p>
  <p>Configured automatically using EC2 user data.</p>
  <p>Hosted on Amazon EC2 in eu-north-1.</p>
</body>
</html>
EOF

# Start Apache and enable it after reboots
systemctl enable --now httpd
