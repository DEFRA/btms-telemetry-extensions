FROM grafana/otel-lgtm AS cdms-grafana-dashboard

ENV ENABLE_LOGS_ALL=true

WORKDIR "/"

ARG PORT=8085
ENV PORT=${PORT}
EXPOSE ${PORT}

# CDP PLATFORM HEALTHCHECK REQUIREMENT
RUN dnf install curl -y --allowerasing

# Required to route UI and data feed ports to grafana
RUN dnf install nginx -y --allowerasing
COPY routes.conf /routes.conf

RUN mkdir otel-lgtm/btms-grafana-dashboards
COPY ./grafana-dashboards/dashboards/* otel-lgtm/btms-grafana-dashboards
COPY ./grafana-dashboards/btms-provider.yml otel-lgtm/grafana/conf/provisioning/dashboards/

COPY --chmod=0755 start.sh /start.sh

CMD ["./start.sh"]
