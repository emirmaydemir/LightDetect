%Emir Muhammet Aydemir - 171419008
% Görüntüyü yükle
image = imread('res7.jpg');

% Görüntüyü göster
figure;
imshow(image);
title('Orjinal Görüntü');

% Görüntüyü RGB renk uzayına dönüştür
rgbImage = image;

% Kırmızı renk için eşik değerlerini ayarla
redThresholdLow = 150;
redThresholdHigh = 255;

% Yeşil renk için eşik değerlerini ayarla
greenThresholdLow = 0;
greenThresholdHigh = 100;

% Sarı renk için eşik değerlerini ayarla
yellowThresholdLow = 150;
yellowThresholdHigh = 255;

% Kırmızı renk için maske oluştur
% Kırmızı renk için maske oluştur
redMask = (rgbImage(:,:,1) >= redThresholdLow) & (rgbImage(:,:,2) < redThresholdLow) & (rgbImage(:,:,3) < redThresholdLow);

% Yeşil renk için maske oluştur
greenMask = (rgbImage(:,:,1) >= greenThresholdLow) & (rgbImage(:,:,1) <= greenThresholdHigh) & ...
            (rgbImage(:,:,2) >= redThresholdLow) & (rgbImage(:,:,2) <= redThresholdHigh) & ...
            (rgbImage(:,:,3) >= yellowThresholdLow) & (rgbImage(:,:,3) <= yellowThresholdHigh);

% Sarı renk için maske oluştur
yellowMask = (rgbImage(:,:,1) >= yellowThresholdLow) & (rgbImage(:,:,1) <= yellowThresholdHigh) & ...
             (rgbImage(:,:,2) >= redThresholdLow) & (rgbImage(:,:,2) <= redThresholdHigh) & ...
             (rgbImage(:,:,3) >= greenThresholdLow) & (rgbImage(:,:,3) <= greenThresholdHigh);

% Kırmızı renk bölgelerini bul ve çiz
redBoundingBoxes = regionprops(redMask, 'BoundingBox');
redBoundingBoxes = cat(1, redBoundingBoxes.BoundingBox);

figure;
imshow(image);
title('Kırmızı Renk Bölgeleri');
hold on;
for i = 1:size(redBoundingBoxes, 1)
    rectangle('Position', redBoundingBoxes(i, :), 'EdgeColor', 'r', 'LineWidth', 2);
end
hold off;

% Yeşil renk bölgelerini bul ve çiz
greenBoundingBoxes = regionprops(greenMask, 'BoundingBox');
greenBoundingBoxes = cat(1, greenBoundingBoxes.BoundingBox);

figure;
imshow(image);
title('Yeşil Renk Bölgeleri');
hold on;
for i = 1:size(greenBoundingBoxes, 1)
    rectangle('Position', greenBoundingBoxes(i, :), 'EdgeColor', 'g', 'LineWidth', 2);
end
hold off;

% Sarı renk bölgelerini bul ve çiz
yellowBoundingBoxes = regionprops(yellowMask, 'BoundingBox');
yellowBoundingBoxes = cat(1, yellowBoundingBoxes.BoundingBox);

figure;
imshow(image);
title('Sarı Renk Bölgeleri');
hold on;
for i = 1:size(yellowBoundingBoxes, 1)
    rectangle('Position', yellowBoundingBoxes(i, :), 'EdgeColor', 'y', 'LineWidth', 2);
end
hold off;
