FROM python:3.9.16-slim

WORKDIR /app

COPY ["requirements.txt", "app.py","object_detection_helper.py","search_and_translate.py","settings.py","./"]


RUN pip install googletrans==4.0.0-rc1
RUN pip install tflite-support==0.3.1
RUN pip install Flask
RUN pip install pillow
RUN pip install google-search-results
RUN pip install tensorflow-cpu
RUN pip install gunicorn
RUN pip install requests
RUN pip install flask_cors

COPY ["model zoo/chicken.tflite","model zoo/crop_disease.tflite","model zoo/fruits_harvest.tflite", "model zoo/weeds.tflite","./model zoo/"]

EXPOSE 8080

ENTRYPOINT ["gunicorn", "--bind=0.0.0.0:8080", "app:app"]





