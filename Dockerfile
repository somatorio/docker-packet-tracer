FROM ubuntu:16.04

RUN apt-get update && apt-get install -y --no-install-recommends libqtwebkit4 libqt4-scripttools libqt4-svg libssl1.0.0 ca-certificates wget && \
wget http://www.labcisco.com.br/app/Cisco-PT-7x64.tar.gz -O /root/pt.tar.gz && \
mkdir -p /opt/pt && \
tar zxvf /root/pt.tar.gz -C /opt/pt --strip 1 && \
sed 's/III/\/opt\/pt/' /opt/pt/tpl.packettracer > /opt/pt/packettracer && \
sed 's/III/\/opt\/pt/' /opt/pt/tpl.linguist > /opt/pt/linguist && \
chmod +x /opt/pt/linguist /opt/pt/packettracer && \
rm -f /root/pt.tar.gz && \
apt-get clean && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD /opt/pt/packettracer
