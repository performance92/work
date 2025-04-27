
window.ENV = {
    WS_DYNAMIC_PATH: "network/websocket/",
    IP_REST_DYNAMIC_PATH: "network/rest/karcin-network/rest-api/",
    IP_MAIN_DYNAMIC_PATH: "network/",
    IP_REMOTE_REST_PATH: "network/remoteRest",
    WS_REMOTE_CONNECTION_PATH: "network/remote/guacamole/websocket-tunnel"
};


const addressStart = {
    ip: window.location.protocol + "//" + window.location.hostname + "/",
    ws: (window.location.protocol === "http:" ? "ws://" : "wss://") + window.location.hostname + "/"
};


const wsDynamicPath = window.ENV.WS_DYNAMIC_PATH || "websocketNetworkNew/";
const ipRestDynamicPath = window.ENV.IP_REST_DYNAMIC_PATH || "network-new/rest/karcin-network/rest-api/";
const ipMainDynamicPath = window.ENV.IP_MAIN_DYNAMIC_PATH || "network-new/";
const ipRemoteRestPath = window.ENV.IP_REMOTE_REST_PATH || "remoteRest/";
const wsRemoteConnectionPath = window.ENV.WS_REMOTE_CONNECTION_PATH || "remote/guacamole/websocket-tunnel";


const customHostname = ""; // Eğer boş bırakılırsa varsayılan olarak window.location.hostname kullanılacak
const hostname = customHostname || window.location.hostname;

const flowBaseConfig = {
    baseUrl: window.location.protocol + "//" + hostname + ":3001",
    basePath: "d-solo/eebjy4osznlkwc/gardiyantest",
    orgId: 1,
    timezone: "browser",
    refresh: "5s",
    theme: "light"
};



const flowTabs = [
    { id: 1, title: "Traffic Overview", langText: "trafficOverview", frames: [
        { chartId: 10, cols: { lg: 12, xl: 12 }, title: "All Traffic", height: { default: 400 } },
        { chartId: 3, cols: { lg: 12, xl: 12 }, title: "Bytes - Packet", height: { default: 400 } }
    ]},
    { id: 2, title: "Traffic Panel", langText: "trafficPanel", frames: [
        { chartId: 12, cols: { lg: 12, xl: 12 }, title: "Traffic Panel", height: { default: 1500 } }
    ]},
    { id: 3, title: "Source Analysis", langText: "sourceAnalysis", frames: [
        { chartId: 5, cols: { lg: 12, xl: 6 }, title: "Top Source (HOST)", height: { default: 600 } },
        { chartId: 8, cols: { lg: 12, xl: 6 }, title: "Top Source (PORT)", height: { default: 600 } }
    ]},
    { id: 4, title: "Destination Analysis", langText: "destinationAnalysis", frames: [
        { chartId: 7, cols: { lg: 12, xl: 6 }, title: "Top Destination (HOST)", height: { default: 600 } },
        { chartId: 9, cols: { lg: 12, xl: 6 }, title: "Top Destination (PORT)", height: { default: 600 } }
    ]},
    { id: 5, title: "Application & Interfaces", langText: "applicationInterfaces", frames: [
        { chartId: 6, cols: { lg: 12, xl: 12 }, title: "Top Application", height: { default: 400 } },
        { chartId: 2, cols: { lg: 12, xl: 12 }, title: "Top Interfaces", height: { default: 400 } }
    ]},
    { id: 6, title: "Connections", langText: "connections", frames: [
        { chartId: 11, cols: { lg: 12, xl: 12 }, title: "Top Conversation", height: { default: 400 } },
        { chartId: 1, cols: { lg: 12, xl: 12 }, title: "Last_NetFlow_Connections", height: { default: 400 } }
    ]}
];


window.defaultConfig = {
    modulName: "network",
    "name-tr": "Uygulama Katalog Sistemi",
    "name-en": "Application Catalog System",
    "name-ru": "Система каталогов приложений",
    "name-az": "Tətbiq Kataloq Sistemi",
    "logo-tr": "new-gardiyan-logo-light.svg",
    mainDomain: addressStart.ip + ipMainDynamicPath,
    restApiUrl: addressStart.ip + ipRestDynamicPath,
    authDomain: addressStart.ip + "auth/",
    webSocketUrl: addressStart.ws + wsDynamicPath,
    remoteConnectionUrl: addressStart.ws + wsRemoteConnectionPath,
    remoteConnectionRestApiUrl: addressStart.ip + ipRemoteRestPath,
    restApiUrlAuth: addressStart.ip + "auth/rest/karcin-auth/rest-api/",
    mainDomainForRepo: addressStart.ip + "repo/report/Network/",
    mapCoordinate: [38.4706699, 34.5809488],
    mapZoom: 5,
    flowTabs,
    flowBaseConfig
};


window.languages = [
    { langCode: "tr", langText: "Türkçe" },
    { langCode: "en", langText: "English" },
    { langCode: "az", langText: "Azerbaycan Dili" },
    { langCode: "ru", langText: "Pусский" },
    { langCode: "fr", langText: "Français" },
    { langCode: "de", langText: "Deutsch" },
    { langCode: "ko", langText: "한국인" },
    { langCode: "zh", langText: "汉语" },
    { langCode: "es", langText: "Español" },
    { langCode: "fa", langText: "Persian (فارسی)", ltr: true },
    { langCode: "ar", langText: "اللغة العربية", ltr: true },
    { langCode: "ur", langText: "اردو", ltr: true }
];


const languageModulName = window.defaultConfig?.modulName + "Language";
let currentLang = localStorage.getItem("langId") || navigator.language.slice(0,2);

if (!window.languages.some(lang => lang.langCode === currentLang)) {
    currentLang = "en";
}
localStorage.setItem("langId", currentLang);

const getLanguageFile = lang => {
    const request = new XMLHttpRequest();
    request.open("GET", window.defaultConfig.mainDomain + lang + ".json");
    request.onload = function() {
        if (this.status === 200) {
            const storedLang = localStorage.getItem(languageModulName);
            if (!storedLang || storedLang !== this.response) {
                localStorage.setItem(languageModulName, this.response);
                location.reload();
            }
        }
    };
    request.send();
};

window.changeLanguage = async lang => {
    localStorage.setItem("langId", lang);
    localStorage.setItem("lang", lang);
    getLanguageFile(lang);
};


try {
    window.Language = JSON.parse(localStorage.getItem(languageModulName)) || {};
} catch (e) {
    window.Language = {};
    alert("Language JSON not valid.");
}

getLanguageFile(currentLang);

window.getLangText = (key, replacements) => {
    let text = window.Language[key] || key;
    if (replacements) {
        Object.keys(replacements).forEach(k => {
            text = text.replace(new RegExp(`{(${k})}`, "g"), replacements[k]);
        });
    }
    return text.replace(/\{(.*?)\}/g, "•");
};
