FROM ubuntu
RUN apt-get update
RUN apt-get install nginx -y
ADD . /var/www/html/
WORKDIR /var/www/html
CMD nginx -g 'daemon off;' && --bind 0.0.0.0:$PORT






# Run the app.  CMD is required to run on Heroku
# $PORT is set by Heroku			
#CMD gunicorn --bind 0.0.0.0:$PORT wsgi 


#FROM nginx:latest
#COPY index.html /usr/share/nginx/html

#EXPOSE 80
#CMD ["nginx","-g","daemon off;"]
# Run the app.  CMD is required to run on Heroku
# $PORT is set by Heroku			
#CMD gunicorn --bind 0.0.0.0:$PORT wsgi 

