%%%%%%%%%%%%%%%G filter%%%%%%%%%%%%%%%%%

file_path1 ='/xxx/desktop/training/fire/';
img = dir(strcat(file_path1,'*.jpg'));
Len=length(img); 

for i=1:Len
    path=pwd;
    cd '/xxx/desktop/training/fire';
    a=imread(img(i).name);
    g=a(:,:,2); 
    w = fspecial('average', 3);
    g_fil=imfilter(g,w,'replicate');

    cd '/xxx/desktop/datasets/G/fire';
    Name = [num2str(i), '.jpg'];
    imwrite(g_fil, Name);
    cd (path);
end

file_path2 ='/xxx/desktop/training/candle/';
img2 = dir(strcat(file_path2,'*.jpg'));
Len2=length(img2);

for i=1:Len2
    path2=pwd;
    cd '/xxx/desktop/training/candle';
    a=imread(img2(i).name);
    if (numel(size(a))<3)
        continue;
    else
        g2=a(:,:,2); 
        w = fspecial('average', 3);
        g2_fil=imfilter(g2,w,'replicate');
        cd '/xxx/desktop/datasets/G/candle';
        Name2 = [num2str(i), '.jpg'];
        imwrite(g2_fil,Name2);
        cd (path2);
    end
    
end

file_path3 ='/xxx/desktop/training/not fire/';
img3 = dir(strcat(file_path3,'*.jpg'));
Len3=length(img3);

for i=1:Len3
    path3=pwd;
    cd '/xxx/desktop/training/not fire';
    a=imread(img3(i).name);
    g3=a(:,:,2); 
    w = fspecial('average', 3);
    g3_fil=imfilter(g3,w,'replicate');
    cd '/xxx/desktop/datasets/G/not fire';
    Name3 = [num2str(i), '.jpg'];
    imwrite(g3_fil, Name3);
    cd (path3);
end