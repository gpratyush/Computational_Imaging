frames_bw = load('frames.mat','frames');
frames_bw = frames_bw.frames;
frames_rgb = load('frames_rgb.mat','frames');
frames_rgb = frames_rgb.frames;
frames_sz = size(frames_bw);
template = frames_bw(399:641,376:555,1); %book
%template = frames_bw(315:629,800:895,1); %big bottle
%template = frames_bw(411:518,569:611,1); %small bottle
wind_x = [100:1000]; %these 2 for book
wind_y = [100:720]; 
%wind_x = [400:1280]; %these 2 for big bottle
%wind_y = [10:720];
%wind_x = [430:750]; %these 2 for small bottle
%wind_y = [250:640];
s_x=zeros(frames_sz(3),1);
s_y=zeros(frames_sz(3),1);
for i = 1:frames_sz(3)
    window = frames_bw(wind_y,wind_x,i);
    c= normxcorr2(template,window);
    [ypeak, xpeak] = find(c==max(c(:)));
    yoffSet = ypeak-size(template,1);
    xoffSet = xpeak-size(template,2);
    s_x(i) = xoffSet;
    s_y(i) = yoffSet;
end
t_x=s_x(1);
t_y=s_y(1);
for i = 1:frames_sz(3)
    s_x(i) = s_x(i)-t_x;
    s_y(i) = s_y(i)-t_y;
end
output = zeros(size(frames_rgb(:,:,:,1)));
for i=1:frames_sz(3)
    im=frames_rgb(:,:,:,i);
    im = imtranslate(im, [-s_x(i),-s_y(i)],'FillValues', [0,0,0]); % can have clever fill value to prevent blacking
    output = output+(double(im)./frames_sz(3));
end
out=uint8(output);
imshow(out);