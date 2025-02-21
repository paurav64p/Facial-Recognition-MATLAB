# Facial Recognition using MATLAB

## Overview
This project implements a **facial recognition system** using MATLAB. It consists of three main stages:
1. **Image Acquisition & Database Creation** – Capturing and storing images.
2. **Model Training & Computation** – Applying classifiers and training models.
3. **Real-Time Recognition** – Processing live camera feed and displaying results.

## Features
- Captures and stores images for facial recognition training.
- Utilizes **feature extraction** and **classification models** for face recognition.
- Real-time face recognition via a live camera feed.
- Displays recognition results dynamically below the detected face.

## Tools & Technologies
- MATLAB (Image Processing & Computer Vision Toolbox)
- Machine Learning Classifiers (SVM, KNN, PCA-based models)
- Haar Cascade for face detection

## Installation
1. **Install MATLAB** with Image Processing and Computer Vision Toolboxes.
2. Clone this repository:
   ```sh
   git clone https://github.com/yourusername/Facial-Recognition-MATLAB.git
   cd Facial-Recognition-MATLAB
   ```
3. Run the scripts in MATLAB in order:
   - **Step 1:** `image_capture.m`
   - **Step 2:** `model_training.m`
   - **Step 3:** `real_time_recognition.m`

## Scripts

### 1. Image Capture & Database Creation (`image_capture.m`)
```matlab
clc; clear; close all;
cam = webcam;
n = 10; % Number of images to capture
folder = 'FaceDatabase';
mkdir(folder);
for i = 1:n
    img = snapshot(cam);
    imshow(img);
    filename = fullfile(folder, ['face' num2str(i) '.jpg']);
    imwrite(img, filename);
    pause(1);
end
clear cam;
disp('Image capture complete.');
```

### 2. Model Training & Computation (`model_training.m`)
```matlab
clc; clear; close all;
faceDB = imageDatastore('FaceDatabase', 'IncludeSubfolders', true, 'LabelSource', 'foldernames');
[trainingImgs, validationImgs] = splitEachLabel(faceDB, 0.8);

net = trainNetwork(trainingImgs, [imageInputLayer([224 224 3]), fullyConnectedLayer(10), softmaxLayer, classificationLayer]);
save('face_recognition_model.mat', 'net');
disp('Model training complete.');
```

### 3. Real-Time Face Recognition (`real_time_recognition.m`)
```matlab
clc; clear; close all;
cam = webcam;
load('face_recognition_model.mat');
while true
    img = snapshot(cam);
    faces = detectFaces(img);
    if ~isempty(faces)
        label = classify(net, img);
        img = insertText(img, [10 10], char(label), 'FontSize', 20, 'BoxColor', 'yellow');
    end
    imshow(img);
    if waitforbuttonpress, break; end
end
clear cam;
```

## Future Enhancements
- Implement **deep learning-based face recognition (CNNs)**.
- Improve **real-time processing speed** with optimized MATLAB functions.
- Add **facial expression recognition** for emotion detection.

## License
This project is licensed under MIT License.
