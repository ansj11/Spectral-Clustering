x=[3 1 4 1 2;4 2 3 1 1];
for i=1:5
    for j=1:5
        if (x(1,i)-x(1,j))^2+(x(2,i)-x(2,j))^2<=2
           W(i,j)=1;
        end
        %W(i,j)=10^10*exp(-((WN(1,i)-WN(1,j))^2+(WN(2,i)-WN(2,j))^2)/2); %
    end
end
D=zeros(5);
for i=1:5
    for j=1:5
        if i==j
            D(i,j)=sum(W(:,i)); %degree����
        else D(i,j)=0;
        end
    end
end
L=D-W;
[X,Y]=eig(L);% X����������,Y������ֵ�Խ���
Y=eig(L);         % ��ϲ������������ʽ��ʾ����ֵ
[Y_sort, Y_index]= sort(Y,'ascend');     % ����Y_sort������������ֵ��Y_index�������ԭ���
for i=1:5
    jj=Y_index(i);
    X_sort(:,i)=X(:, jj);
end
V=X_sort(:,2:3);

[IDX,C]=kmeans(V,2);

[IDX_sort,IDX_index]=sort(IDX,'ascend');
for i=1:5
    ii=IDX_index(i);
    x_sort(:,i)=x(:,ii);
end

for k=1:2
    num(k)=0;
    
    for l=1:5
        if IDX(l)==k
            num(k)=num(k)+1;
        end
    end
end

    
x1=x_sort(:,1:num(1));

x2=x_sort(:,num(1)+1:num(1)+num(2));
            
%WN3=WN_sort(:,num(2)+1:num(2)+num(3));
    
%WN4=WN_sort(:,num(3)+1:num(3)+num(4));
figure(1),
plot([x1(1,:)],[x1(2,:)],'*',[x2(1,:)],[x2(2,:)],'+')