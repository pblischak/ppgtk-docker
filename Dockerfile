# Dockerfile for PPGtk

FROM ubuntu

MAINTAINER Paul Blischak <blischak.4@osu.edu>

# Get g++ for compiling, wget to download Boost, and make
# to automate program compilation with Makefile provided
RUN apt-get update \
  && apt-get install -y g++ \
                        make \
                        wget

# Download boost, untar, setup install with bootstrap. Only do the Program Options library,
# and then install
WORKDIR /home
RUN wget http://downloads.sourceforge.net/project/boost/boost/1.60.0/boost_1_60_0.tar.gz \
  && tar xfz boost_1_60_0.tar.gz \
  && rm boost_1_60_0.tar.gz \
  && cd boost_1_60_0 \
  && ./bootstrap.sh --prefix=/usr/local --with-libraries=program_options \
  && ./b2 install \
  && cd /home \
  && rm -rf boost_1_60_0

# Download the latest stable release of PPGtk (or clone from GitHub master branch),
# compile and install (i.e., copy binary to /usr/local/bin). Then we remove the source code folder
# and make a directory to run an analysis.
WORKDIR /home
RUN wget https://github.com/pblischak/ppgtk/archive/v0.1.1-alpha.tar.gz \
  && tar xfz v0.1.1-alpha.tar.gz \
  && rm v0.1.1-alpha.tar.gz \
  && cd ppgtk-0.1.1-alpha/src \
  && make linux \
  && make install \
  && cd /home \
  && rm -rf ppgtk-0.1.1-alpha \
  && mkdir analysis

# Start in the analysis directory that we just made and launch a bash shell
# which will open up in this folder. We will attach the folder with the data that we need
# to run PPGtk using the `-v` with `docker run`.
WORKDIR /home/analysis
CMD bash
