A= imread('E:\Desktop\xjtu.jpg');
H=rgb2gray(A);
H=double(H);
[m,n]=size(H);
for i=1:m
    for j=1:n
        if H(i,j)==255;      %��ɫ��ת
            H(i,j)=0;     
        else
            H(i,j)=255;
        end
    end
end

N=sum(nonzeros(H))/255;   %����Ԫ�ĺ����ֵ��������ݵĸ���
x=zeros(2,N);   %��ݾ���?Ϊ2*N

k=1; %��ݸ���ĵ�K��
    for i=1:m
        for j=1:n
            if H(i,j)~=0
                x(1,k)=-i;         %����ݽ��и��?
                x(2,k)=j;
                k=k+1;
            end
        end
    end
for c=10:15    
W=zeros(N,N); %�����ڽӾ���
for i1=1:N
    for i2=1:N
        if norm(x(:,i1)-x(:,i2))<=c
            W(i1,i2)=1;
        end
        %W(i,j)=10^10*exp(-((WN(1,i)-WN(1,j))^2+(WN(2,i)-WN(2,j))^2)/2); %
    end
end
[C, L, D, Q, V ] = SpectralClustering(W, 4);


I1=find(C(:,1)~=0);
%x1=x(:,I1);

I2=find(C(:,2)~=0);
%x2=x(:,I2);
I3=find(C(:,3)~=0);
%x3=x(:,I3);
I4=find(C(:,4)~=0);
%figure(c),imshow(W);
figure(c),plot(x(2,I1),x(1,I1),'+',x(2,I2),x(1,I2),'*',x(2,I3),x(1,I3),'o',x(2,I4),x(1,I4),'v')
end


