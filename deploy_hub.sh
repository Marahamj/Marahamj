#!/bin/bash
set -e #1-to ensure his immediate exit if any anything fails

#2-user and group mangment
useradd_groupadd(){
    groupadd -f hub_admins
    id -u iot_admin &> /dev/null || useradd -m -g hub_admins iot_admin
}
#3-directory & permissions setup
directory_permissions_setup(){
    mkdir -p /srv/iot_hub
    chown iot_admin:hub_admins /srv/iot_hub
    chmod 755 /srv/iot_hub
}
#4-software installation
software_installation(){
   local packages="nginx"
   apt-get update -y
   apt-get install $packages -y
}
#5-firewall configuration
firewall_configuration(){
     ufw default deny incoming #block incomming connection
     ufw default allow outgoing  # allow outgoing connections
     ufw allow ssh   #allow  ssh connections 
     ufw allow http   #allow http conections
     echo 'y'|ufw enable #enable the firewall
}
#6-Content Deployment
 Content_Deployment() {
    cd /srv/iot_hub

cat <<EOF > index.html
<!DOCTYPE html>
 <html>
 <head>
    <title>IOT Device</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
   <header>
     <h1>IoT Hub Dashboard - System Normal</h1>
    </header>
    <section>
      <div class="server_status">
         <h2>IoT Hub Status Overview</h2>
        <p>The system is fully operational and all services are running smoothly.</p>
      </div>
    </section>
    <footer>
       <p>&copy; 2025 IoT Hub</p>
       <p>All rights reserved. Designed and developed by Marah Qandeel.</p>
    </footer>
</body>
</html>
   
EOF
     # Create style.css
cat <<EOF > style.css
   
* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
}
body {
    font-family: "EB Garamond", serif;
    background-color: #000;
    color: #f4f4f4;
    line-height: 1.6;
    display: flex;
    flex-direction: column;
    min-height: 100vh;
}
header {
    background-color: #1a1a1a;
    color: #fff;
    padding: 2rem 0;
    text-align: center;
    border-bottom: 2px solid #007bff;
}
header h1 {
    font-size: 2.8rem;
    font-weight: 700;
}
.server_status {
    background-color: #1a1a1a;
    border-radius: 10px;
    padding: 2rem;
    margin: 2rem auto;
    max-width: 600px;
    box-shadow: 0 5px 15px rgba(0, 123, 255, 0.2);
    text-align: center;
}
.server_status p,
.server_status h2 {
    color: #4CAF50;
}
.server_status h2 {
    font-size: 2rem;
    margin-bottom: 1rem;
}
footer {
    background-color: #1a1a1a;
    color: #bbb;
    text-align: center;
    padding: 1rem 0;
    margin-top: auto;
}
footer p {
    margin: 0.5rem 0;
}
   
EOF

    chown iot_admin:hub_admins index.html style.css
    chmod 644 index.html style.css

    sed -i 's|/var/www/html|/srv/iot_hub|g' /etc/nginx/sites-available/default
}

#7-service management
service_management(){
     systemctl start nginx
     systemctl status nginx
     systemctl enable nginx
}
#8-final verification
final_verification(){
    if pgrep nginx &> /dev/null;then
     echo -e "\e[32mSUCCESS: IoT Hub deployment completed successfully.\e[0m"
   else
      echo -e "\e[31mERROR:IOT Hub deployment failed.\e[0m"
    fi
   

}

#--RUN THE Fucition
deploy_all(){
  useradd_groupadd
  directory_permissions_setup
  firewall_configuration
  software_installation
  Content_Deployment
  service_management
  final_verification

}


deploy_all

