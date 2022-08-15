FROM python:3
 
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install --quiet --assume-yes firefox-esr curl wget sqlite3 \
&& pip install requests pytest selenium

RUN wget -O firefox-latest.tar.bz2 https://download.mozilla.org/\?product=firefox-latest\&os=linux\&lang=en-US \
&& tar -jxf firefox-*	\
&& mv firefox /opt/	\
&& chmod 755 /opt/firefox \
&& chmod 755 /opt/firefox/firefox

RUN GECKODRIVER_VER=$(curl -k -X GET -s https://api.github.com/repos/mozilla/geckodriver/releases/latest | grep tag_name | cut -d '"' -f 4) \
&& echo ${GECKODRIVER_VER} \
&& wget "https://github.com/mozilla/geckodriver/releases/download/${GECKODRIVER_VER}/geckodriver-${GECKODRIVER_VER}-linux64.tar.gz" \
&& tar zxf geckodriver-*.tar.gz \
&& mv geckodriver /usr/bin/

COPY lib /test-flasky-demo-app/lib
COPY tests /test-flasky-demo-app/tests
COPY resources /test-flasky-demo-app/resources
COPY requirements.txt /test-flasky-demo-app

RUN pip3 install -r test-flasky-demo-app/requirements.txt

RUN git clone https://github.com/sh-rdtaci/Flasky.git \
&& cut -d' ' -f1 Flasky/requirements.txt > temp \
&& cat temp > Flasky/requirements.txt \
&& rm temp \
&& pip3 install -r Flasky/requirements.txt

WORKDIR Flasky/
ENV FLASK_PORT 8080
ENV FLASK_APP demo_app
RUN sed -i 's/flask/python3 -m flask/g' run.sh

CMD ["sh", "run.sh"]