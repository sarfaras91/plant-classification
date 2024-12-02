import streamlit as st
from PIL import Image
import numpy as np
import tensorflow as tf
from tensorflow.keras.preprocessing.image import img_to_array
import pymysql

# Load the model
model = tf.keras.models.load_model('complete_model.h5')

# Function to preprocess image for prediction


def prepare_image(image):
    img = image.resize((224, 224))  # Resize the image to the target size
    img_array = img_to_array(img) / 255.0  # Normalize the image
    img_array = np.expand_dims(img_array, axis=0)
    return img_array

# Function to predict the plant type


def predict(image):
    img_array = prepare_image(image)
    predictions = model.predict(img_array)
    predicted_class = np.argmax(predictions, axis=1)[0]
    return predicted_class

# Function to fetch plant info from the database


def fetch_plant_info(predicted_class):
    connection = pymysql.connect(
        host='localhost', user='root', password='', database='plant_identification')
    cursor = connection.cursor()

    # Adjust the predicted_class to match SQL ID (predicted_class + 1)
    cursor.execute("SELECT * FROM plants WHERE id = %s",
                   (predicted_class + 1,))
    result = cursor.fetchone()

    connection.close()
    return result

# Load CSS file


def load_css(file_name):
    with open(file_name) as f:
        st.markdown(f"<style>{f.read()}</style>", unsafe_allow_html=True)


# Load the CSS in your app
load_css("styles.css")

st.markdown("<h1 style='text-align: center; color: #556B2F;'>🌿 Plant Identifier 🌿</h1>",
            unsafe_allow_html=True)

# Upload image
uploaded_file = st.file_uploader(
    "Upload a Plant Leaf Image:", type=["jpg", "jpeg", "png"])
st.markdown("---")

if uploaded_file is not None:

    image = Image.open(uploaded_file)
    st.image(image, caption='Uploaded Image', use_column_width=True)

    # Predict plant type
    if st.button("Identify Plant"):
        predicted_class = predict(image)

        plant_info = fetch_plant_info(predicted_class)

        if plant_info:
            st.subheader("Prediction Result:")

            st.markdown(
                f"""
                <div style=" background: linear-gradient(135deg, #f0f4ff 0%, #e2f9ff 50%, #f9fffc 100%);
                color: #333333;
                border-radius: 10px;
                padding: 20px;
                margin-top: 20px;
                margin-bottom: 50px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);">
                    <h3 style="color: #556B2F;">Name: {plant_info[1]}</h3>
                    <p><strong>Scientific Name:</strong> {plant_info[2]}</p>
                    <p><strong>Care Instructions:</strong> {plant_info[3]}</p>
                    <p><strong>Growing Conditions:</strong> {plant_info[4]}</p>
                    <p><strong>Pests and Diseases:</strong> {plant_info[5]}</p>
                    <p><strong>Harvesting Info:</strong> {plant_info[7]}</p>
                    <p><strong>Seasonality:</strong> {plant_info[8]}</p>
                    <p><strong>Growth Habit:</strong> {plant_info[9]}</p>
                    <p><strong>Nutritional Info:</strong> {plant_info[10]}</p>
                </div>
                """,
                unsafe_allow_html=True
            )

            # Display the image URL if available
            image_url = plant_info[6] if len(plant_info) > 6 else None
            if image_url:
                try:
                    st.image(image_url, caption='Plant Image',
                             use_column_width=True)
                except Exception as e:
                    st.error(f"Error displaying the image: {e}")
            else:
                st.write("No image URL available.")
                st.image("path/to/placeholder/image.jpg",
                         caption='Placeholder Image', use_column_width=True)
        else:
            st.write("Plant not found in the database.")
