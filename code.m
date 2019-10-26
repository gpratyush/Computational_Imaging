%   Computational Imaging Quiz 2   %
% Read Image and Video into files
im= imread('image.jpg');
vid = VideoReader('video_1.mp4');
frames_rgb = read(vid);
im_sz = size(im);
vid_sz = size(frames_rgb);
save('frames1_rgb.mat','frames_rgb')
imshow(frames_rgb(:,:,:,1));
im = rgb2gray(im);
frames_bw=zeros(vid_sz);
for i = 1:vid_sz(4)
    frames_bw(:,:,1,i) = rgb2gray(frames_rgb(:,:,:,i));
end
imshow(frames_bw(:,:,1,1));
frames_bw(:,:,[2,3],:) = [];
frames_bw = squeeze(frames_bw);
save('frames_bw.mat','frames_bw');
save('image.mat','im');
