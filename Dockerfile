from python:2.7

workdir /tmp 
run wget http://www.mega-nerd.com/libsndfile/files/libsndfile-1.0.28.tar.gz
run tar -xzvf libsndfile-1.0.28.tar.gz
workdir libsndfile-1.0.28
run ./configure
run make -j8
run make -j8 install
run mkdir /app
run apt update
run apt install sox -y
COPY ./ /app/
WORKDIR /app
run pip install numpy==1.11.3
run pip install -r requirements.txt
CMD /bin/bash
