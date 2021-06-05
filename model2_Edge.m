%%%%%%%%%%%%sobel filter%%%%%%%%%%%%

file_path1 ='/xxx/desktop/training/fire/';
img = dir(strcat(file_path1,'*.jpg'));
Len=length(img); 

for i=1:Len
    path=pwd;
    cd '/xxx/desktop/training/fire';
    a=imread(img(i).name);
    I=rgb2gray(a);
    
    hx=[-1 -2 -1;0 0 0 ;1 2 1];
    hy=hx';                            
 
    gradx=filter2(hx,I,'same');
    gradx=abs(gradx); 
  
    grady=filter2(hy,I,'same');
    grady=abs(grady); 
    grad=gradx+grady;
    
    cd '/xxx/desktop/datasets/edge/fire';
    Name = [num2str(i), '.jpg'];
    imwrite(grad, Name);
    cd (path);
end


file_path2 ='/xxx/desktop/training/candle/';
img2 = dir(strcat(file_path2,'*.jpg'));
Len2=length(img2);

for i=1:Len2
    path2=pwd;
    cd '/xxx/desktop/training/candle';
    a=imread(img2(i).name);
    I=a;
    if (numel(size(a))==3)
        
        I=rgb2gray(a);
    end
    
    hx=[-1 -2 -1;0 0 0 ;1 2 1];
    hy=hx';                            
 
    gradx=filter2(hx,I,'same');
    gradx=abs(gradx); 
  
    grady=filter2(hy,I,'same');
    grady=abs(grady); 
    grad=gradx+grady;
    
    cd '/xxx/desktop/datasets/edge/candle';
    Name2 = [num2str(i), '.jpg'];
    imwrite(grad, Name2);
    cd (path2);
end


file_path3 ='/xxx/desktop/training/not fire/';
img3 = dir(strcat(file_path3,'*.jpg'));
Len3=length(img3);

for i=1:Len3
    path3=pwd;
    cd '/xxx/desktop/training/not fire';
    a=imread(img3(i).name);
    I=rgb2gray(a);
    
    hx=[-1 -2 -1;0 0 0 ;1 2 1];
    hy=hx';                            
 
    gradx=filter2(hx,I,'same');
    gradx=abs(gradx);
  
    grady=filter2(hy,I,'same');
    grady=abs(grady); 
    grad=gradx+grady;
    
    cd '/xxx/desktop/datasets/edge/not fire';
    Name3 = [num2str(i), '.jpg'];
    imwrite(grad, Name3);
    cd (path3);
end