FROM python:3.8.12-slim

WORKDIR /app

COPY ["requirements.txt","./"]

RUN pip install -r requirements.txt

COPY ["app.py","easy_predict_helper.py","Crop_recommendation.csv","Victor_Nigerian_soil_database.csv","./"]

COPY ["models/classifier.py","models/catboost_model.pkl","./models/"]

EXPOSE 8080

ENTRYPOINT ["gunicorn", "--bind=0.0.0.0:8080", "app:app"]
