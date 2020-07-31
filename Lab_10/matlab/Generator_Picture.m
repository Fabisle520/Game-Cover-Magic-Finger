
clear

clc
picture=imread('./over.png');
Num=size(picture);
R=picture(:,:,1);
G=picture(:,:,2);
B=picture(:,:,3);
R=reshape(R,[1,Num(1)*Num(2)]);
G=reshape(G,[1,Num(1)*Num(2)]);
B=reshape(B,[1,Num(1)*Num(2)]);
fid = fopen('./over_R_Rom.coe','wt');

fprintf(fid,'memory_initialization_radix = 10;\nmemory_initialization_vector = ');
for i = 1 : 10000

    if mod(i-1,100) == 0 

        fprintf(fid,'\n');

    end

    fprintf(fid,'%4d,',R(i));

end

fid = fopen('./over_G_Rom.coe','wt');

fprintf(fid,'memory_initialization_radix = 10;\nmemory_initialization_vector = ');
for i = 1 : 0000

    if mod(i-1,100) == 0 

        fprintf(fid,'\n');

    end

    fprintf(fid,'%4d,',G(i));

end

fid = fopen('./over_B_Rom.coe','wt');

fprintf(fid,'memory_initialization_radix = 10;\nmemory_initialization_vector = ');
for i = 1 : 0000

    if mod(i-1,100) == 0 

        fprintf(fid,'\n');

    end

    fprintf(fid,'%4d,',B(i));

end