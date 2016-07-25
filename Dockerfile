############################################################ 
# Dockerfile to build epub conversion Image
# Based on Ubuntu 14:04
############################################################ 

FROM ubuntu:14.04

#Java Insatallation
#====================
RUN apt-get update && apt-get install -y openjdk-7-jdk
RUN rm -rf /var/lib/apt/lists/*

#Perl Installation
#===================
RUN apt-get update && apt-get install -y build-essential perl cpanminus libxml-parser-perl
RUN rm -rf /var/lib/apt/lists/*
RUN cpanm CPAN::Meta \
 Archive::Zip \
 Array::Utils \ 
 Config::Tiny \
 Data::Dumper \
 Digest::MD5 \
 Encode \
 FindBin \
 File::Path \
 File::Slurp \
 File::NCopy \
 File::Find  \
 File::Basename \
 File::Find::Rule \
 Getopt::Long \
 Image::ExifTool \
 JSON \
 Math::Complex \
 Spreadsheet::DataFromExcel \
 Spreadsheet::ParseExcel \
 Try::Tiny \
 Time::HiRes \
 Text::Unidecode \
 XML::XPath \
 XML::XPath::XMLParser \
 YAML \
 ExtUtils::MakeMaker


RUN cpanm --force Net::RabbitMQ

#ImageMagick Installation
#=======================
RUN apt-get update && apt-get install -y imagemagick
RUN rm -rf /var/lib/apt/lists/*


#Ruby Installation
#===================
RUN apt-get update && apt-get install -y software-properties-common python-software-properties
RUN add-apt-repository ppa:brightbox/ruby-ng
RUN apt-get update && apt-get install -y ruby2.2 ruby2.2-dev ruby-bundler
RUN apt-get update && apt-get install -y git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev
RUN apt-get update && apt-get -y install imagemagick libmagickcore-dev libmagickwand-dev
RUN rm -rf /var/lib/apt/lists/*
RUN gem install bundler \
 fileutils \
 nokogiri \
 nokogiri-diff \
 rmagick \
 rubyzip \
 rubyzip2 \
 tdiff

RUN rm -rf /var/lib/apt/lists/*

#Win Installation
#=============
RUN dpkg --add-architecture i386
RUN apt-get update -y && apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:ubuntu-wine/ppa
RUN apt-get update -y && apt-get install -y wine1.7 winetricks xvfb
RUN apt-get purge -y software-properties-common
RUN apt-get autoclean -y

#Install RabbitMQ
#============
#RUN wget -O- https://www.rabbitmq.com/rabbitmq-release-signing-key.asc | apt-key add -
#RUN apt-get update && apt-get install rabbitmq-server
#RUN rabbitmq-plugins enable rabbitmq_management
#ADD /usr/bin/rabbitmq-start /usr/local/bin/
#CMD ["rabbitmq-start"]
#EXPOSE 5672
#EXPOSE 15672
