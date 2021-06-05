file_path1 ='/xxx/desktop/training/fire/';
img = dir(strcat(file_path1,'*.jpg'));
Len=length(img); 

for i=1:Len
    path=pwd;
    cd '/xxx/desktop/training/fire';
    
    a=imread(img(i).name);
    temp=rgb2gray(a);
    result=ordfilt2(temp,5,ones(3,3));

    cd '/xxx/desktop/datasets/midfreq/fire';
    Name = [num2str(i), '.jpg'];
    imwrite(result, Name);
    cd (path);
end


file_path2 ='/xxx/desktop/training/candle/';
img2 = dir(strcat(file_path2,'*.jpg'));
Len2=length(img2);

for i=1:Len2
    path2=pwd;
    cd '/xxx/desktop/training/candle';
    a=imread(img2(i).name);
    temp2=a;
    if (numel(size(a))==3)  
        temp2=rgb2gray(a);
    end
    
    result2=ordfilt2(temp2,5,ones(3,3));
    cd '/xxx/desktop/datasets/midfreq/candle';
    Name2 = [num2str(i), '.jpg'];
    imwrite(result2, Name2);
    cd (path2);
end


file_path3 ='/xxx/desktop/training/not fire/';
img3 = dir(strcat(file_path3,'*.jpg'));
Len3=length(img3);

for i=1:Len3
    path3=pwd;
    cd '/xxx/desktop/training/not fire';
    a=imread(img3(i).name);
    temp3=rgb2gray(a);
    result3=ordfilt2(temp3,5,ones(3,3));
    cd '/xxx/desktop/datasets/midfreq/not fire';
    Name3 = [num2str(i), '.jpg'];
    imwrite(result3, Name3);
    cd (path3);
end
