FROM jupyter/datascience-notebook

RUN pip install papermill[all]
RUN pip install jupyter jupyterhub ethercalc-python
RUN pip install dist/prog_edu_assistant_tools-0.2-py3-none-any.whl

ARG NB_USER=jovyan
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}

# RUN adduser --disabled-password \
#    --gecos "Default user" \
#    --uid ${NB_UID} \
#    ${NB_USER}

COPY . ${HOME}
USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}
