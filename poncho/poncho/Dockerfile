FROM python:3.10 AS compile

WORKDIR /app

RUN apt-get update && \
    pip install virtualenv

ENV VIRTUAL_ENV=/opt/venv
RUN python -m virtualenv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

COPY ./requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt

COPY . /app/

FROM python:3.10-slim

WORKDIR /app

COPY --from=compile /opt/venv /opt/venv
COPY --from=compile /app /app

RUN rm -rf /app/static

ENV PATH="/opt/venv/bin:$PATH"


RUN chmod +x /app/entrypoint.sh

EXPOSE 8000

ENTRYPOINT [ "./entrypoint.sh" ]