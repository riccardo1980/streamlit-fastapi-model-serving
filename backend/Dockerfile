FROM tiangolo/uvicorn-gunicorn:python3.7

RUN mkdir /backend

COPY requirements.txt /backend

WORKDIR /backend

RUN pip install -r requirements.txt -f https://download.pytorch.org/whl/torch_stable.html

COPY . /backend

EXPOSE 8000

ENV TORCH_HOME=/backend/torch_cache

CMD ["uvicorn", "server:app", "--host", "0.0.0.0", "--port", "8000"]