FROM nginx:latest
COPY index.html /var/www/html/
EXPOSE 80
CMD ["nginx","-g","daemon off;"]
# Run the app.  CMD is required to run on Heroku
# $PORT is set by Heroku			
#CMD gunicorn --bind 0.0.0.0:$PORT wsgi 

