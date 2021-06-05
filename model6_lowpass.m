file_path1 ='/xxx/desktop/training/fire/';
img = dir(strcat(file_path1,'*.jpg'));
Len=length(img); 

for i=1:Len
    path=pwd;
    cd '/xxx/desktop/training/fire';
    a=imread(img(i).name);
    
    a = mat2gray(a,[0 255]);
    [M,N] = size(a);
    P = 2*M;
    Q = 2*N;
    fc = zeros(M,N);
 
    for x = 1:1:M
        for y = 1:1:N
            fc(x,y) = a(x,y) * (-1)^(x+y);
        end
    end
 
    F = fft2(fc,P,Q);
 
    H_1 = zeros(P,Q);
    H_2 = zeros(P,Q);
 
    for x = (-P/2):1:(P/2)-1
        for y = (-Q/2):1:(Q/2)-1
            D = (x^2 + y^2)^(0.5);
            D_0 = 100;
            H_1(x+(P/2)+1,y+(Q/2)+1) = 1/(1+(D/D_0)^2);   
            H_2(x+(P/2)+1,y+(Q/2)+1) = 1/(1+(D/D_0)^6);
        end
    end

    G_1 = H_1 .* F;
    G_2 = H_2 .* F;
 
    g_1 = real(ifft2(G_1));
    g_1 = g_1(1:1:M,1:1:N);
 
    g_2 = real(ifft2(G_2));
    g_2 = g_2(1:1:M,1:1:N);         
 
    for x = 1:1:M
        for y = 1:1:N
            g_1(x,y) = g_1(x,y) * (-1)^(x+y);
            g_2(x,y) = g_2(x,y) * (-1)^(x+y);
        end
    end
    
    cd '/xxx/desktop/datasets/lowpass/fire';
    Name = [num2str(i), '.jpg'];
    imwrite(g_2, Name);
    cd (path);
end
