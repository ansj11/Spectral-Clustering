x1=-0.8:0.2:0.8;
e1=rand(1,9)/10;
y1=sqrt(1-x1.^2)+e1;
x2=-1.8:0.2:1.8;
e2=rand(1,19)/5;
y2=sqrt(4-x2.^2)+e2;
plot(x1,y1,'*',x2,y2,'+');
z=[x1 x2;y1,y2];
D=zeros(28);
for c=0.6:0.1:1
for i=1:28
    for j=1:28
        if norm(z(:,i)-z(:,j))<c
            w(i,j)=1;
        end
        %W(i,j)=exp(-norm(z(:,i)-z(:,j)));
    end
    D(i,i)=sum(w(i,:));
end

L=D-w;
[X,Y]=eig(L);% X����������,Y������ֵ�Խ���
Y=eig(L);         % ��ϲ������������ʽ��ʾ����ֵ
[Y_sort, Y_index]= sort(Y,'ascend');     % ����Y_sort������������ֵ��Y_index�������ԭ���
X_sort = X(:, Y_index);  

figure(2),imshow(w);
title('adjacent matrix')
%figure(4),imshow(L);
%title('laplace matrix')

V=X_sort(:,2:3);

[IDX,C]=kmeans(V,2);

[IDX_sort,IDX_index]=sort(IDX,'ascend');
z_sort=z(:,IDX_index);

for k=1:2
    num(k)=0;
    
    for l=1:28
        if IDX(l)==k
            num(k)=num(k)+1;
        end
    end
end

    
z1=z_sort(:,1:num(1));

z2=z_sort(:,num(1)+1:28);
indx=c*10            
figure(indx),
plot(z1(1,:),z1(2,:),'*',z2(1,:),z2(2,:),'+')
end