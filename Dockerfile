FROM runnable/laravel-starter

# Add Repository
ADD [".", "/var/www/"]
WORKDIR /var/www/

# Apply proper file-access permissions for Apache2
RUN rm -rf /var/www/html/ \
 && ln -s /var/www/public /var/www/html \
 && chown -R www-data /var/www/ \
 && chgrp -R www-data /var/www/ \
 && chmod -R 775 /var/www/storage

# Command to start the app
CMD php artisan migrate && apache2-foreground
