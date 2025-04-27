const express = require('express');
const axios = require('axios');
const app = express();

app.use(express.json());

const PORT = process.env.PORT || 3000;

const tokenMapping = {
  "client": "client",
  "client_frontend": "client_frontend",
  "admin" : "admin",
  "admin_frontend": "admin_frontend",
  "auth" : "auth",
  "auth_frontend" : "auth_frontend",
  "log_center" : "log_center",
  "network" : "network",
  "network_frontend" : "network_frontend",
  "network_worker" : "network_worker",
  "pam" : "pam",
  "pam_frontend" : "pam_frontend",
  "patch" : "patch",
  "patch_frontend" : "patch_frontend"	
  "soc" : "soc",
  "soc_frontend" : "soc_frontend",
  
};

const baseJenkinsUrl = 'http://172.16.21.167:8080/generic-webhook-trigger/invoke?token=';

app.post('/webhook', async (req, res) => {
  const payload = req.body;
  console.log('Gelen orijinal payload:', JSON.stringify(payload, null, 2));
  
  let jenkinsToken = null;
  if (payload.component && payload.component.name) {
    const compName = payload.component.name;
    if (tokenMapping[compName]) {
      jenkinsToken = tokenMapping[compName];
      console.log(`Component '${compName}' için seçilen token: ${jenkinsToken}`);
    } else {
      console.log(`Component name '${compName}' için eşleşen token bulunamadı.`);
    }
  } else {
    console.log("Payload'da component.name bilgisi bulunamadı.");
  }
  
  if (jenkinsToken) {
    const jenkinsUrl = baseJenkinsUrl + jenkinsToken;
    
    const filteredPayload = {
      component: payload.component,
      action: payload.action,
      timestamp: payload.timestamp,
      repositoryName: payload.repositoryName,
      initiator: payload.initiator
    };
    
    console.log('Filtrelenmiş payload:', JSON.stringify(filteredPayload, null, 2));
    
    try {
      const response = await axios.post(jenkinsUrl, filteredPayload, {
        headers: { 'Content-Type': 'application/json' }
      });
      console.log(`Jenkins'e gönderildi. Status: ${response.status}`);
    } catch (error) {
      console.error('Jenkins\'e gönderilirken hata oluştu:', error.message);
    }
  } else {
    console.log("Bu payload herhangi bir Jenkins job'una yönlendirilmeyecek.");
  }
  
  res.sendStatus(200);
});

app.listen(PORT, () => {
  console.log(`Webhook filtreleme sunucusu ${PORT} portunda çalışıyor.`);
});
