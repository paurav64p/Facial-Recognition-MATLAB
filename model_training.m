clc; clear; close all;
faceDB = imageDatastore('FaceDatabase', 'IncludeSubfolders', true, 'LabelSource', 'foldernames');
[trainingImgs, validationImgs] = splitEachLabel(faceDB, 0.8);

net = trainNetwork(trainingImgs, [imageInputLayer([224 224 3]), fullyConnectedLayer(10), softmaxLayer, classificationLayer]);
save('face_recognition_model.mat', 'net');
disp('Model training complete.');