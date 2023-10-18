FROM debian:11-slim
RUN apt-get update && apt-get install -y python3 pip gconf-service libasound2 libatk1.0-0 libatk-bridge2.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget libcairo-gobject2 libxinerama1 libgtk2.0-0 libpangoft2-1.0-0 libthai0 libpixman-1-0 libxcb-render0 libharfbuzz0b libdatrie1 libgraphite2-3 libgbm1 texlive-xetex texlive-fonts-recommended texlive-plain-generic && \
    apt-get clean
WORKDIR /report
VOLUME /report/src
COPY . /report
RUN pip install -r requirements.txt && \
    pip install nbconvert[webpdf] && \
    pyppeteer-install && \
    playwright install chromium
EXPOSE 80

CMD ["jupyter-book", "build", "./src", "--builder", "pdfhtml"]
