# streamlit-fastapi-model-serving

Fork of [streamlit-fastapi-model-serving](https://github.com/davidefiocco/streamlit-fastapi-model-serving), see also  [this blogpost](https://davidefiocco.github.io/streamlit-fastapi-ml-serving) and [PyConES 2020 video](https://www.youtube.com/watch?v=IvHCxycjeR0).

Put simply:
- model: [image semantic segmentation](https://pytorch.org/hub/pytorch_vision_deeplabv3_resnet101/)
- backend: [FastAPI](https://fastapi.tiangolo.com/)
- frontend: [streamlit](https://www.streamlit.io/)
- orchestration: [docker-compose](https://docs.docker.com/compose/)

To run the example in a machine running Docker and docker-compose, run:
```Bash
./download_models.sh
docker-compose build
docker-compose up
```
To visit the FastAPI documentation of the resulting service, visit http://localhost:8000 with a web browser.  
To visit the streamlit UI, visit http://localhost:8501.

Logs can be inspected via:
```Bash
docker-compose logs
```

# Deployment

To deploy the app, one option is deployment on Heroku (with [Dockhero](https://elements.heroku.com/addons/dockhero)). To do so:

- rename `docker-compose.yml` to `dockhero-compose.yml`
- create an app (we refer to its name as `<my-app>`) on a Heroku account
- install locally the Heroku CLI, and enable the Dockhero plugin with `heroku plugins:install dockhero`
- add to the app the DockHero add-on (and with a plan allowing enough RAM to run the model!)
- in a command line enter `heroku dh:compose up -d --app <my-app>` to deploy the app
- to find the address of the app on the web, enter `heroku dh:open --app <my-app>`
- to visualize the api, visit the address adding port `8000/docs`, e.g. `http://dockhero-<named-assigned-to-my-app>-12345.dockhero.io:8000/docs`(not `https`)
- visit the address adding `:8501` to visit the streamlit interface
- logs are accessible via `heroku logs -p dockhero --app <my-app>`

# Debugging

To modify and debug the app, [development in containers](https://davidefiocco.github.io/debugging-containers-with-vs-code) can be useful (and kind of fun!).
