FROM python:3.10-alpine as base

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

FROM python:3.10-slim as development

WORKDIR /app

COPY src/ .
COPY --from=base /usr/local/lib/python3.10/site-packages /usr/local/lib/python3.10/site-packages

EXPOSE 5002 8001

CMD ["python", "app.py"]