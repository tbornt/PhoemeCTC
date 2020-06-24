from python:2.7

# Build libsndfile
WORKDIR /tmp 
RUN wget http://www.mega-nerd.com/libsndfile/files/libsndfile-1.0.28.tar.gz
RUN tar -xzvf libsndfile-1.0.28.tar.gz
WORKDIR libsndfile-1.0.28
RUN ./configure
RUN make -j8
RUN make -j8 install

# install sox
RUN apt update
RUN apt install sox -y

# Install python deps
WORKDIR /app
COPY requirements.txt /app/requirements.txt
# Needs to be installed before audiolab for some reason.
RUN pip install numpy==1.11.3
RUN pip install -r requirements.txt

CMD /bin/bash
