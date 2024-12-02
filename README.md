````markdown
# 🌿 Plant Identifier App 🌿

A Streamlit-based app that identifies plants from leaf images using a TensorFlow model and fetches details from a MySQL database.

---

## Features

- **Upload a leaf image:** Identify the plant species with a single click.
- **Detailed plant information:** View scientific name, care tips, growing conditions, and more.
- **Interactive and clean UI:** Enhanced with custom CSS styling for an improved user experience.
- **Powered by:** TensorFlow for image classification and MySQL for data storage.

---

## Setup

### 1. Install Dependencies

Install the required Python packages using the provided `requirements.txt` file:

```bash
pip install -r requirements.txt
```
````

### 2. Set Up MySQL Database

- Execute the SQL script `plants_table.sql` to create the `plants` table.
- Update the database credentials in `app.py` to match your local MySQL setup:
  ```python
  connection = pymysql.connect(
      host='localhost',
      user='your_user',
      password='your_password',
      database='plant_identification'
  )
  ```

### 3. Run the App

Launch the Streamlit app using the following command:

```bash
streamlit run app.py
```

---

## File Overview

- **`app.py`**: Main logic of the Streamlit app, including image upload, prediction, and database query functions.
- **`model.py`**: Contains functions for preprocessing images and predicting plant species (if separated; otherwise integrated in `app.py`).
- **`plants_table.sql`**: SQL script to set up the MySQL `plants` table.
- **`styles.css`**: Custom CSS file for enhancing the app's appearance.

---

## Usage

1. Upload a plant leaf image using the file uploader.
2. Click the **Identify Plant** button.
3. View the prediction result and detailed plant information directly in the app.

---

## License

This project is licensed under the [MIT License](LICENSE). Feel free to use, modify, and distribute the code with attribution.

---

![App Screenshot](images/screenshot.png)
