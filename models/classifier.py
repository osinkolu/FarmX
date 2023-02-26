import pickle, json
import pandas as pd

def classify(raw_data):
    data = pd.DataFrame(raw_data["raw_values"])
    model=pickle.load(open("models/catboost_model.pkl","rb"))
    prediction=model.predict(data).tolist()
    prediction = [i[0] for i in prediction]
    return(json.dumps(prediction))