clc;clear;
I=imread('test.jpg');
I=im2double(I);
I=rgb2gray(I);
%椒盐噪声部分
figure();
%显示原图
subplot(1,3,1);
imshow(I,[]);%[]自动产生适当的比例显示图像
title('原图');
%添加椒盐信号
subplot(1,3,2);
I_noise1=double(imnoise(I,'salt & pepper',0.02));%salt & pepper注意中间的空格 无空格报错
imshow(I_noise1,[]);
title('椒盐噪声');
%添加高斯噪声
subplot(1,3,3 );
I_noise2=double(imnoise(I,'gaussian',0.02));%salt & pepper注意中间的空格 无空格报错
imshow(I_noise2,[]);title('高斯噪声');

f= I_noise1;
[w,h]=size(f);
image1=I;
image2= f;
fsize=3;
fssize=(fsize-1)/2;

figure();
subplot(1,3,1);
imshow(image1);
xlabel('原图像');
subplot(1,3,2);
imshow(image2);
xlabel('加噪声');
resultImage = image2;

for x=1+fssize:1:w-fssize
    for y=1+fssize:1:w-fssize
        is=f(x-fssize:1:x+fssize,y-fssize:1:y+fssize);
        resultImage(x,y)=sum(is(:))/numel(is); 
    end
end

subplot(1,3,3);
imshow(resultImage);
xlabel('算术均值滤波器');
imwrite(resultImage,'1.jpg');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure();
subplot(1,3,1);
imshow(image1);
xlabel('原图像');
subplot(1,3,2);
imshow(image2);
xlabel('加噪声');
resultImage = image2;

for x=1+fssize:1:w-fssize
    for y=1+fssize:1:w-fssize
        is=f(x-fssize:1:x+fssize,y-fssize:1:y+fssize);
        resultImage(x,y)=prod(prod(is(:)))^(1/numel(is)); 
    end
end

subplot(1,3,3);
imshow(resultImage);
xlabel('几何均值滤波器');
imwrite(resultImage,'2.jpg');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure();
subplot(1,3,1);
imshow(image1);
xlabel('原图像');
subplot(1,3,2);
imshow(image2);
xlabel('加噪声');
resultImage = image2;

for x=1+fssize:1:w-fssize
    for y=1+fssize:1:w-fssize
        is=f(x-fssize:1:x+fssize,y-fssize:1:y+fssize);
        is=1./is;
        resultImage(x,y)=numel(is)/sum(is(:)); 

    end
end

subplot(1,3,3);
imshow(resultImage);
xlabel('谐波均值滤波器');
imwrite(resultImage,'3.jpg');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure();
subplot(1,3,1);
imshow(image1);
xlabel('原图像');
subplot(1,3,2);
imshow(image2);
xlabel('加噪声');
Q1 = 1.5;
resultImage = image2;

for x=1+fssize:1:w-fssize
    for y=1+fssize:1:w-fssize
        is=f(x-fssize:1:x+fssize,y-fssize:1:y+fssize);
        resultImage(x,y) = sum(is(:).^(Q1+1))/sum(is(:).^(Q1));
    end
end

subplot(1,3,3);
imshow(resultImage);
xlabel('逆谐波均值滤波器');
imwrite(resultImage,'4.jpg');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure();
subplot(1,3,1);
imshow(image1);
xlabel('原图像');
subplot(1,3,2);
imshow(image2);
xlabel('加噪声');

resultImage = image2;

for x=1+fssize:1:w-fssize
    for y=1+fssize:1:w-fssize
        is=f(x-fssize:1:x+fssize,y-fssize:1:y+fssize);
        temp = sort(is(:));
        resultImage(x,y)= temp((numel(temp)-1)/2);
    end
end


subplot(1,3,3);
imshow(resultImage);
xlabel('中值滤波器');
imwrite(resultImage,'5.jpg');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure();
subplot(1,3,1);
imshow(image1);
xlabel('原图像');
subplot(1,3,2);
imshow(image2);
xlabel('加噪声');

resultImage = image2;

for x=1+fssize:1:w-fssize
    for y=1+fssize:1:w-fssize
        is=f(x-fssize:1:x+fssize,y-fssize:1:y+fssize);
        temp = is(:);
        resultImage(x,y)= max(temp);
    end
end


subplot(1,3,3);
imshow(resultImage);
xlabel('最大值滤波器');
imwrite(resultImage,'6.jpg');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure();
subplot(1,3,1);
imshow(image1);
xlabel('原图像');
subplot(1,3,2);
imshow(image2);
xlabel('加噪声');
resultImage = image2;

for x=1+fssize:1:w-fssize
    for y=1+fssize:1:w-fssize
        is=f(x-fssize:1:x+fssize,y-fssize:1:y+fssize);
        temp = is(:);
        resultImage(x,y)= min(temp);
    end
end


subplot(1,3,3);
imshow(resultImage);
xlabel('最小值滤波器');
imwrite(resultImage,'7.jpg');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure();
subplot(1,3,1);
imshow(image1);
xlabel('原图像');
subplot(1,3,2);
imshow(image2);
xlabel('加噪声');

resultImage = image2;

for x=1+fssize:1:w-fssize
    for y=1+fssize:1:w-fssize
        is=f(x-fssize:1:x+fssize,y-fssize:1:y+fssize);
        temp = is(:);
        resultImage(x,y)= (max(temp) + min(temp))/2;
    end
end
 

subplot(1,3,3);
imshow(resultImage);
xlabel('中点滤波器');
imwrite(resultImage,'8.jpg');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

