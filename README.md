# DOCKER-CSVSERVER PROJECT

# Instructions
## Part I
    
    In Part I we are going access the CSVSERVER application with Loaded Data. Follow the below mentioned steps to access the application. 

### Prerequisites :
- Host Os : Have unbuntu with common pre-requsites installed.
- Have [Docker](https://docs.docker.com/engine/install/ubuntu/) and [Docker-Compose](https://docs.docker.com/compose/install/) installed on Host Machine as per docker official documentation.
- Have [Git](https://git-scm.com/download/linux) installed and configured.

### Steps to Follow :
- Clone the GitHub Repository.
    ```bash
    git clone https://github.com/guhanwe/csvserver.git
    ```
- Navigate to new working directory
    ```bash
    cd ~/csvserver/
    ```
- Run Docker container in background with dependency options [ Port mapping (-p 9393:9300), Environment variables (-e CSVSERVER_BORDER=Orange), Container Name (--name=csvsrv), Image (infracloudio/csvserver:latest) ]. 
    ```bash
    docker run -td -p 9393:9300 -e CSVSERVER_BORDER=Orange --name=csvsrv infracloudio/csvserver:latest
    ```
- Container is created  with Exited status because of dependency file missing . Do check the status and logs.
    ```bash
    docker ps -a
    docker logs --details csvsrv
    ```
- Copy dependency file (**inputFile**) from Host to Container as (**inputdata**)
    ```bash
    docker cp inputFile csvsrv:/csvserver/inputdata
    ```
- Start the Docker after copying
    ```bash
    docker start csvsrv
    ```
- Confirm Container is Up and Running
    ```bash
    docker ps -a
    ```
- Goto Web-Browser and search for the Site
    ```html
    http://localhost:9393/
    ```
## Part II
    
    In Part II we are going access the CSVSERVER application with Loaded Data Using DOCKER-COMPOSE UP . Follow the below mentioned steps to access the application.

- To Stop and Remove existing container
    ```bash
    docker stop csvsrv
    docker rm csvsrv
    ```
- Run the Application by DOCKER-COMPOSE-UP using docker-compose.yaml
    ```bash
    docker-compose up -d
    ```
- Confirm Container is Up and Running
    ```bash
    docker ps -a
    ```
- Goto Web-Browser and search for the Site
    ```html
    http://localhost:9393/
    ```
## Part III
    
    In Part III we are going to add CSVSERVER Application as endpoint and collect the data from PROMETHEUS Using DOCKER-COMPOSE UP . Follow the below mentioned steps to access the application.

- To access Prometheus, Goto Web-Browser and search for the Site
    ```html
    http://localhost:9090/
    ```
- To Confirm State of CSVSERVER Application, Click on
    ```html
    Status -> Targets -> Endpoint -> State is UP
    ```

- To query and view the data in Prometheus.
    >  Click on Graph

    >  Type **csvserver_records** in in the query box, Click on Execute and then switch to the Graph tab.

    > It should show a straight line graph with value 10
