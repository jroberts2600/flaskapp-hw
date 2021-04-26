FROM python:3.8
LABEL project="DevImages"
LABEL maintainer="jrockstl@gmail.com"
LABEL version="1.BUILDNUMBER"
RUN useradd -ms /bin/bash  pyuser
RUN echo 'pyuser:pyuser' | chpasswd
COPY requirements.txt ./
RUN pip install --upgrade "pip < 21.0"
RUN pip install --no-cache-dir -r requirements.txt
COPY app.py /home/pyuser
WORKDIR /home/pyuser
USER pyuser
ENTRYPOINT ["python"]
CMD ["app.py"]
