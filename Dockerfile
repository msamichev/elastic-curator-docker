FROM python:3.6-alpine

RUN pip install  elasticsearch-curator \
    && sed -i -- 's/\(5, 99, 99\)/6, 99, 99/g' /usr/local/lib/python3.6/site-packages/curator/defaults/settings.py \
    && rm -rf /var/cache/apk/*

COPY ./config/ /config
COPY ./scripts/docker-entrypoint.sh /

RUN chmod 744 docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]