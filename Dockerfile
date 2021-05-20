FROM httpd:2.4
COPY ./index.html /usr/local/apache2/htdocs/
COPY ./img_nature_wide.jpg /usr/local/apache2/htdocs/
