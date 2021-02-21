FROM jupyter/datascience-notebook

RUN pip install papermill[all]
RUN pip install jupyter jupyterhub ethercalc-python
RUN wget https://repo.huaweicloud.com/repository/pypi/packages/72/1e/7d266e384196b2eda0a8784899c6491bd60155de3e03e2a3028c03e3df89/prog_edu_assistant_tools-0.2-py3-none-any.whl#sha256=a257de9db0ffac90f7463201f52e72881e3bfcc216dd6a0e74f6541509a40cea
RUN pip install https://repo.huaweicloud.com/repository/pypi/simple/prog-edu-assistant-tools/prog_edu_assistant_tools-0.2-py3-none-any.whl

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
