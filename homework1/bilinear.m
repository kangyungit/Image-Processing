% ˫���Բ�ֵ
% ����ͼ���ļ����Ŵ���
% ������ݷŴ��ʱ仯�����ͼ��
function bilinear_interpolation = bilinear_interpolation(filename,R)

% ��ʼ��������ͼ��ͼ������Ϊm*n*color
img = imread(filename);
% �仯��ͼ��
[row,col,color] = size(img);    % ���ͼ�����������ɫ����
row = round(row*R);     % ��ͼ����
col = round(col*R);     % ��ͼ����

% ��ͼ���ʼ��
% ʹ��class���ԭͼ����������ͣ�ʹ����ͼ������������ԭͼ�񱣳�һ��
img_new = zeros(row,col,color,class(img));

% ����ͼ����С��С�ɫ�帳ֵ
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
            u = i/R-floor(i/R); %��ȡˮƽ�����ϵ�Ȩ��
            v = j/R-floor(j/R); %��ȡ��ֱ�����ϵ�Ȩ��
            % �˴���Ҫ��ͼ���Ե�������⴦��
            % ������ͼ���ұ�Ե���±�Ե������ڲ�ֵ����
            if i >= row-R || j >= col-R
                img_new(i,j,n) = img(x,y,n);
            else
                img_new(i,j,n) = u*v*img(x,y,n)+(1-u)*v*img(x+1,y,n)+u*(1-v)*img(x,y+1,n)+(1-u)*(1-v)*img(x+1,y+1,n);
            end
        end
    end
end

% ��ʾԭͼ��
figure;
imshow(img);
title("Original Image");

% ��ʾ��ͼ��
figure;
imshow(img_new);
title("New Image");
end