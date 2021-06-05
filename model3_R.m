%%%%%%%%%%%R_filter%%%%%%%%%%%%%

file_path1 ='/xxx/desktop/training/fire/';
img = dir(strcat(file_path1,'*.jpg'));
Len=length(img); 

for i=1:Len
    path=pwd;
    cd '/xxx/desktop/training/fire';
    a=imread(img(i).name);
    r=a(:,:,1); 
    w = fspecial('average', 3);
    r_fil=imfilter(r,w,'replicate');

    cd '/xxx/desktop/datasets/R/fire';
    Name = [num2str(i), '.jpg'];
    imwrite(r_fil, Name);
    cd (path);
end

file_path2 ='/xxx/desktop/training/candle/';
img2 = dir(strcat(file_path2,'*.jpg'));
Len2=length(img2);

for i=1:Len2
    path2=pwd;
    cd '/xxx/desktop/training/candle';
    a=imread(img2(i).name);
    r2=a(:,:,1); 
    w = fspecial('average', 3);
    r2_fil=imfilter(r2,w,'replicate');
    cd '/xxx/desktop/datasets/R/candle';
    Name2 = [num2str(i), '.jpg'];
    imwrite(r2_fil,Name2);
    cd (path2);
end

file_path3 ='/xxx/desktop/training/not fire/';
img3 = dir(strcat(file_path3,'*.jpg'));
Len3=length(img3);

for i=1:Len3
    path3=pwd;
    cd '/xxx/desktop/training/not fire';
    a=imread(img3(i).name);
    r3=a(:,:,1); 
    w = fspecial('average', 3);
    r3_fil=imfilter(r3,w,'replicate');
    cd '/xxx/desktop/datasets/R/not fire';
    Name3 = [num2str(i), '.jpg'];
    imwrite(r3_fil, Name3);
    cd (path3);
end