
# configuracion android dev en linux con android studio

- coneccion de celular con ubuntu
  modo desarrollador . coneccion inalambrica

```

adb pair 192.168.1.6:38031

```

- Cuando te lo pida, ingresa el código:
```
44455

```

- luego conecta el dispositivo:
```
adb connect 192.168.1.6:5555
```
- Verifica la conexión::
```
adb devices
```
- para limpiar la memoria y la configuracion echa por android studio
  al gererar el apk debug por primera vez 
  
```
./gradlew clean assembleDebug
adb shell am force-stop com.example.manuelaso
``` 
- luego ya se podra copilar y ejecutar en el celular android 
  , comando para compilar

```
./gradlew assembleDebug
``` 
- script bash para mostrar en el telefono

```
./play.sh
``` 

 

  



  

  

