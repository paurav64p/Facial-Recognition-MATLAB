lc; clear; close all;
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