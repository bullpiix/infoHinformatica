
#!/bin/bash

# Ruta del APK
APK_PATH="./app/build/outputs/apk/debug/app-debug.apk"

# Colores para visualización
GREEN="\e[32m"
RED="\e[31m"
YELLOW="\e[33m"
RESET="\e[0m"

echo -e "${YELLOW}🔍 Verificando dispositivos ADB...${RESET}"
adb devices | grep -w "device" > /dev/null
if [ $? -ne 0 ]; then
    echo -e "${RED}❌ No hay dispositivos conectados. Conecta uno por USB o usa 'adb connect IP:PORT'.${RESET}"
    exit 1
fi
echo -e "${GREEN}✅ Dispositivo conectado.${RESET}"

echo -e "${YELLOW}📦 Verificando existencia de APK...${RESET}"
if [ ! -f "$APK_PATH" ]; then
    echo -e "${RED}❌ APK no encontrada en: $APK_PATH${RESET}"
    exit 1
fi
echo -e "${GREEN}✅ APK encontrada.${RESET}"

echo -e "${YELLOW}📲 Instalando APK...${RESET}"
adb install -t -r "$APK_PATH"
if [ $? -ne 0 ]; then
    echo -e "${RED}❌ Falló la instalación.${RESET}"
    exit 1
fi
echo -e "${GREEN}✅ APK instalada correctamente.${RESET}"

echo -e "${YELLOW}🔍 Detectando nombre del paquete...${RESET}"


PACKAGE="com.example.manuelaso"

echo -e "${GREEN}📦 Paquete detectado: $PACKAGE${RESET}"

echo -e "${YELLOW}🚀 Lanzando la app...${RESET}"
adb shell monkey -p "$PACKAGE" -c android.intent.category.LAUNCHER 1
echo -e "${GREEN}✅ Comando de lanzamiento ejecutado.${RESET}"
