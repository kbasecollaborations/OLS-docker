#git clone https://github.com/Ensembl/OLS-docker.git
#docker ps -a | grep "ols" | awk '{print "docker rm "$1}' | sh
docker ps -a | grep "ols" | awk '{print "docker stop "$1 " && docker rm "$1 }' | sh
docker ps -a | grep "8080" | awk '{print "docker stop "$1 " && docker rm "$1 }' | sh
cd OLS-docker
#wget -O ols-config.yaml "https://www.ebi.ac.uk/ols/api/ols-config?ids=co_357,po,to,envo,uo"
#wget -O ols-config.yaml "https://www.ebi.ac.uk/ols/api/ols-config?ids=co_357,po,to"
docker build -t ols .
docker run -d -p 8080:8080 -t ols
