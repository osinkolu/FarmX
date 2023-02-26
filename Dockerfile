FROM python:3.8.12-slim

RUN pip install pipenv

WORKDIR /app
COPY ["Pipfile", "Pipfile.lock","./"]

RUN pipenv install --system --deploy

COPY ["app.py","easy_predict_helper.py","Crop_recommendation.csv","Victor_Nigerian_soil_database.csv","./"]

COPY ["models/classifier.py","models/catboost_model.pkl","./models/"]

EXPOSE 8080

ENTRYPOINT ["gunicorn", "--bind=0.0.0.0:8080", "app:app"]
