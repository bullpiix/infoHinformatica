# istalar sql server en ubuntu con doker
-primero instalamos doker 

```

sudo apt update
sudo apt install -y docker.io
sudo systemctl enable --now docker
`y
- descargargamos la imagen sql server

```

sudo docker run -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=TuContraseña123!' \
   -p 1433:1433 --name sqlserver \
   -d mcr.microsoft.com/mssql/server:2022-latest
```  

-  instalmos sqlcmd en tu Ubuntu (fuera del contenedor)

```
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
curl https://packages.microsoft.com/config/ubuntu/22.04/prod.list | sudo tee /etc/apt/sources.list.d/msprod.list
sudo apt update
sudo ACCEPT_EULA=Y apt install -y mssql-tools unixodbc-dev
```
- Luego, añade sqlcmd al PATH:

```

echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
source ~/.bashrc
```
- abrir sql server en la terminal
```
sqlcmd -S localhost -U SA -P 'TuContraseña123!'
```
- abrir sql server desde archivo  main.sql
```
sqlcmd -S localhost -U SA -P 'TuContraseña123!' -i script.sql
```
# si ya no nesecitas usar el servidor 
```
sudo docker stop sqlserver
```
# volver a habilitar el server doker con sql     

```

sudo docker start sqlserver
```
venecachera122
