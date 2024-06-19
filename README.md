# llm_training

# Experimentation
### Chapter 1
  - elastic_search_playgrount.ipynb contains the initial experimentation with elastic search and prompt creation

## Useful commands

```bash
docker volume create esdata
```
```bash
docker run -it -d --name elasticsearch -e "discovery.type=single-node" -e "xpack.security.enabled=false" -v esdata:/usr/share/elasticsearch/data -p 9200:9200 -p 9300:9300 docker.elastic.co/elasticsearch/elasticsearch:8.4.3
```

Run llm docker
```bash
docker run -it -v $(pwd):/app llm
```
run jupyter notebook
```bash
jupyter-lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root
```

In order to build both containers where you'd be able to access elasticsearch from llm you should run 
```docker compose up -d --build```
Later, in order to access the jupyterlab running in our container, print the logs with `docker logs llm` and take the token.