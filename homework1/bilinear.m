% 双线性插值
% 输入图像文件及放大率
% 输出根据放大率变化后的新图像
function bilinear_interpolation = bilinear_interpolation(filename,R)

% 初始化，读入图像，图像数据为m*n*color
img = imread(filename);
% 变化后图像
[row,col,color] = size(img);    % 获得图像的行列数及色板数
row = round(row*R);     % 新图像行
col = round(col*R);     % 新图像列

% 新图像初始化
% 使用class获得原图像的数据类型，使得新图像数据类型与原图像保持一致
img_new = zeros(row,col,color,class(img));

% 对新图像的行、列、色板赋值
for i = 1:row
    for j = 1:col
        for n = 1:color
            x = round(i/R);
            y = round(j/R);
            if x == 0
                x = x+1;
            end
            if y ==0
                y = y+1;
            end
            u = i/R-floor(i/R); %求取水平方向上的权重
            v = j/R-floor(j/R); %求取垂直方向上的权重
            % 此处需要对图像边缘进行例外处理
            % 本例对图像右边缘及下边缘用最近邻插值计算
            if i >= row-R || j >= col-R
                img_new(i,j,n) = img(x,y,n);
            else
                img_new(i,j,n) = u*v*img(x,y,n)+(1-u)*v*img(x+1,y,n)+u*(1-v)*img(x,y+1,n)+(1-u)*(1-v)*img(x+1,y+1,n);
            end
        end
    end
end

% 显示原图像
figure;
imshow(img);
title("Original Image");

% 显示新图像
figure;
imshow(img_new);
title("New Image");
end