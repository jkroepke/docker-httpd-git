FROM registry.access.redhat.com/ubi8/ubi-minimal

EXPOSE 8080

VOLUME /opt/git/

RUN microdnf install httpd git \
    && microdnf clean all \
    && sed -i 's/Listen 80/Listen 8080/' /etc/httpd/conf/httpd.conf \
    && sed -ri 's!^(\s*CustomLog)\s+\S+!\1 |/usr/bin/cat!g; s!^(\s*ErrorLog)\s+\S+!\1 |/usr/bin/cat!g;' /etc/httpd/conf/httpd.conf \
    && mkdir -p /opt/git/ \
    && chmod 777 /opt/git/ /run/httpd/

ADD git.conf /etc/httpd/conf.d/git.conf

USER 1001

CMD ["/usr/sbin/httpd", "-DFOREGROUND"]