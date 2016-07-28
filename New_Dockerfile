############################################################ 
# Dockerfile to build epub conversion Image
# Based on Ubuntu 14:04
############################################################ 
FROM ubuntu:14.04

#Java Insatallation
#====================
RUN apt-get update && apt-get install -y software-properties-common python-software-properties build-essential git-core curl zlib1g-dev libmagickcore-dev libmagickwand-dev libssl-dev libreadline-dev libyaml-dev libxml2-dev libxslt1-dev libcurl4-openssl-dev libffi-dev libxml-parser-perl
RUN apt-get install -y openjdk-7-jdk && rm -rf /var/lib/apt/lists/*

#Perl Installation
#===================
RUN apt-get update && apt-get install -y  perl cpanminus && rm -rf /var/lib/apt/lists/*
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
 File::Copy::Recursive \
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

#Ruby Installation
#===================
RUN add-apt-repository ppa:brightbox/ruby-ng
RUN apt-get update && apt-get install -y ruby2.2 ruby2.2-dev ruby-bundler && rm -rf /var/lib/apt/lists/*
RUN gem install bundler \
 fileutils \
 nokogiri \
 nokogiri-diff \
 rmagick \
 rubyzip \
 rubyzip2 \
 tdiff \
&& rm -rf /var/lib/apt/lists/*

#ImageMagic wkhtmltopdf Install
#=====================
RUN add-apt-repository -y ppa:ubuntu-wine/ppa
RUN add-apt-repository -y ppa:ecometrica/servers
RUN apt-get update && apt-get install -y  imagemagick wkhtmltopdf xvfb 
RUN apt-get -f install
RUN rm -rf /var/lib/apt/lists/*

