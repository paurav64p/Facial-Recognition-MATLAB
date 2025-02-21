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