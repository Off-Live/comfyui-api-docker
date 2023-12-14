FROM python:3.10

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends curl unzip vim && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# install google chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
RUN apt-get -y update
RUN apt-get install -y google-chrome-stable

# install chromedriver
# RUN apt-get install -yqq unzip
# RUN wget -O /tmp/chromedriver.zip http://chromedriver.storage.googleapis.com/`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE`/chromedriver_linux64.zip
# RUN unzip /tmp/chromedriver.zip chromedriver -d /usr/local/bin/

RUN cd /root \
    && git clone https://github.com/Off-Live/ComfyUI.git \
    && cd ComfyUI && pip install -r requirements.txt

RUN cd /root/ComfyUI && python main.py --quick-test-for-ci --cpu

RUN cd /root \
    && git clone https://github.com/Off-Live/comfyui-api-converter \
    && cd comfyui-api-converter \
    && pip install -r requirements.txt

# RUN cd /root \
#     && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
#     && apt -y install  ./google-chrome-stable_current_amd64.deb

ADD src .

RUN chmod +x /start.sh

CMD /start.sh